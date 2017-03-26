import PlaygroundSupport

public struct MachineArray<Element> where Element: ItemConvertible {
    let items: [Int: Element]

    public let configuration: [PlaygroundValue]

    init(_ items: [Int: Element] = [:], configuration: [PlaygroundValue]? = nil) {
        self.items = items
        self.configuration = configuration ?? MachineArray.initialConfiguration(for: items)
    }

    public init(_ items: Element...) {
        self.init(items.indexedDictionary)
    }

    public subscript(position: Int) -> Element {
        return items[position]!
    }

    public func filter(_ isIncluded: @escaping (Element) throws -> Bool) rethrows -> MachineArray<Element> {
        let result = try items.filterPairs { try isIncluded($1) }
        return MachineArray(result, configuration: configuration + MachineArray.configuration(for: result, method: .filter))
    }

    /*public func map<T: ItemConvertible>(_ transform: (Element) throws -> T) rethrows -> MachineArray<T> {
        let result = try items.map(transform)
        return MachineArray<T>(result, configuration: configuration + MachineArray.configuration(for: result, method: .map))
    }

    public func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result {
        let result = try items.reduce(initialResult, nextPartialResult)
        return result
    }*/

    private static func initialConfiguration(for items: [Int: ItemConvertible]) -> [PlaygroundValue] {
        let spawner = Spawner.configuration(forItems: items)
        let conveyor = Conveyor.configuration(length: 128)
        return [spawner, conveyor]
    }

    private static func configuration(for items: [Int: ItemConvertible], method: Operation.Method) -> [PlaygroundValue] {
        let operation = Operation.configuration(forItems: items, method: method)
        let conveyor = Conveyor.configuration()
        return [operation, conveyor]
    }
}
