import PlaygroundSupport

public protocol ItemSerializable {
    var title: String { get }
}

extension ItemSerializable {
    var configuration: PlaygroundValue {
        return .dictionary([
            "title": .string(title)
        ])
    }
}
