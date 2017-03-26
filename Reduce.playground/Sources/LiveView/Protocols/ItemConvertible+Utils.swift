import PlaygroundSupport

extension ItemConvertible {
    var configuration: PlaygroundValue {
        return .dictionary([
            "title": .string(title)
        ])
    }
}
