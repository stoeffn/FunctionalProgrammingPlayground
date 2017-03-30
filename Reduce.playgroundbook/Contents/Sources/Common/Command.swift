import PlaygroundSupport

enum Command {
    case reset
    case addComponent(Configuration)
    case trigger
}

extension Command: RawRepresentable {
    typealias RawValue = PlaygroundValue

    private static let key = "command"
    private static let configurationKey = "configuration"

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
