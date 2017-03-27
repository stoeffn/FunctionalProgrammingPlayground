import PlaygroundSupport

public struct MachineValue<Element: ItemSerializable>: MachineSerializable {
    public let value: Element?

    init(_ item: Element? = nil, configuration: [PlaygroundValue]? = nil) {
        self.item = item
        self.configuration = configuration ?? MachineValue.spawnerConfiguration(for: [0: item])
    }

    public init(_ item: Element) {
        self.init(item)
    }
}
