import PlaygroundSupport


/// Command to the live view.
///
/// - reset: Removes the current machine.
/// - addComponent: Add a new component (e.g. a conveyor or an operation) to the current machine.
/// - trigger: Trigger the current machine, i.e. tell the spawner to spawn its items.
enum Command {
    case reset
    case addComponent(Configuration)
    case trigger
}

extension Command: RawRepresentable {
    typealias RawValue = PlaygroundValue

    /// The raw data key for the command name.
    private static let key = "command"

    /// The raw data key for additional command parameters.
    private static let configurationKey = "configuration"

    /// Creates a command by serialized "raw" data.
    public init?(rawValue: RawValue) {
        guard case .dictionary(let message) = rawValue,
            let command = message[Command.key]?.string else { return nil }

        switch command {
        case "reset":
            self = .reset
        case "addComponent":
            guard let configuration = message[Command.configurationKey]?.dictionary else { return nil }
            self = .addComponent(configuration)
        case "trigger":
            self = .trigger
        default:
            return nil
        }
    }

    /// Returns the command in a serialized form, which can be passed around and deserialized later on.
    public var rawValue: RawValue {
        switch self {
        case .reset:
            return .dictionary([Command.key: .string("reset")])
        case .addComponent(let configuration):
            return .dictionary([
                Command.key: .string("addComponent"),
                Command.configurationKey: .dictionary(configuration)
            ])
        case .trigger:
            return .dictionary([Command.key: .string("trigger")])
        }
    }
}
