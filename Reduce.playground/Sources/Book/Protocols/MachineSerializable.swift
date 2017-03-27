import PlaygroundSupport

protocol MachineSerializable {
    var configuration: [PlaygroundValue] { get }
}
