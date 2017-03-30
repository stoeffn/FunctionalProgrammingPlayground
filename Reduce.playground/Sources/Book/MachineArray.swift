import PlaygroundSupport

public var machineProxy: PlaygroundRemoteLiveViewProxy?

public struct MachineArray<Element> where Element: ItemSerializable {
    let items: [Int: Element]

    init(_ items: [Int: Element] = [:]) {
        self.items = items
    }

    public init(_ items: Element...) {
        let indexedItems = items.indexedDictionary
        self.init(indexedItems)

        machineProxy?.send(command: .reset)
        machineProxy?.send(command: .addComponent(spawner(with: indexedItems)))
        machineProxy?.send(command: .addComponent(conveyor(withLength: 128)))
    }

    public subscript(position: Int) -> Element {
        return items[position]!
    }

    public func filter(_ isIncluded: @escaping (Element) throws -> Bool) rethrows -> MachineArray<Element> {
        let result = try items.filterPairs { try isIncluded($1) }
        machineProxy?.send(command: .addComponent(operation(with: result, method: .filter)))
        machineProxy?.send(command: .addComponent(conveyor()))
        return MachineArray(result)
    }

    public func map<T: ItemSerializable>(_ transform: (Element) throws -> T) rethrows -> MachineArray<T> {
        let result = try items.mapPairs { ($0, try transform($1)) }
        machineProxy?.send(command: .addComponent(operation(with: result, method: .map)))
        machineProxy?.send(command: .addComponent(conveyor()))
        return MachineArray<T>(result)
    }

    public func reduce<Result: ItemSerializable>(_ initialResult: Result,
                       _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result {
        let result = try items.values.reduce(initialResult, nextPartialResult)
        machineProxy?.send(command: .addComponent(operation(with: [0: result], method: .reduce)))
        machineProxy?.send(command: .addComponent(conveyor()))
        return result
    }
}

public func resetMachine() {
    machineProxy?.send(command: .reset)
}

public func triggerMachine() {
    machineProxy?.send(command: .trigger)
}
