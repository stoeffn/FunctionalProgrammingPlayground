import PlaygroundSupport

extension ItemSerializable {
    var configuration: PlaygroundValue {
        return .dictionary([
            "title": .string(title)
        ])
    }
}
