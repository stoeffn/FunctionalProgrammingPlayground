import PlaygroundSupport

/// Holds the current remote live view proxy. Used by `MachineArray` in order to send configurations to the live view.
///
/// - Note: Set this variable *before* using machine array!
public var machineProxy: PlaygroundRemoteLiveViewProxy?

/// Custom wrapper around Swift arrays that provides automatic transmission of configuration information to the live
/// view. This means operations on this structure get automatically visualized in the live view.
///
/// - Note: `machineProxy` must be set accordingly for this to work.
public struct MachineArray<Element> where Element: ItemSerializable, Element: Equatable {
    let items: [Int: Element]

    init(_ items: [Int: Element] = [:]) {
        self.items = items
    }

    /// Initilizes a new machine array. The current machine gets resetted and a new spanwer and conveyor will be added.
    public init(_ items: [Element]) {
        let indexedItems = items.indexedDictionary
        self.init(indexedItems)

        machineProxy?.send(command: .reset)
        machineProxy?.send(command: .addComponent(spawner(with: indexedItems)))
        machineProxy?.send(command: .addComponent(conveyor(withLength: 128)))
    }

    public subscript(position: Int) -> Element {
        return items[position]!
    }

    /// The ordered array this structure represents.
    var array: [Element] {
        return items
            .sorted { $0.0 < $1.0 }
            .map { $1 }
    }

    /// Returns an array containing, in order, the elements of the array that fullfill the given condition. Adds a
    /// conveyor and a filter operation to the machine.
    public func filter(_ isIncluded: @escaping (Element) throws -> Bool) rethrows -> MachineArray<Element> {
        let result = try items.filterPairs { try isIncluded($1) }
        machineProxy?.send(command: .addComponent(operation(with: result, method: .filter)))
        machineProxy?.send(command: .addComponent(conveyor()))
        return MachineArray(result)
    }

    /// Returns an array containing, in order, the transformed elements of the array. Adds a conveyor and a map
    /// operation to the machine.
    public func map<T: ItemSerializable>(_ transform: (Element) throws -> T) rethrows -> MachineArray<T> {
        let result = try items.mapPairs { ($0, try transform($1)) }
        machineProxy?.send(command: .addComponent(operation(with: result, method: .map)))
        machineProxy?.send(command: .addComponent(conveyor()))
        return MachineArray<T>(result)
    }

    /// Returns the result of combining the elements of the sequence using the given closure. Adds a conveyor and a
    /// reduce operation to the machine.
    public func reduce<Result: ItemSerializable>(_ initialResult: Result,
                       _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result {
        let result = try items.values.reduce(initialResult, nextPartialResult)
        machineProxy?.send(command: .addComponent(operation(with: [0: result], method: .reduce)))
        machineProxy?.send(command: .addComponent(conveyor()))
        return result
    }

    public static func == (machineArray: MachineArray<Element>, array: Array<Element>) -> Bool {
        return machineArray.array == array
    }

    public static func == (array: Array<Element>, machineArray: MachineArray<Element>) -> Bool {
        return machineArray == array
    }
}
