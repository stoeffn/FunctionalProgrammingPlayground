import PlaygroundSupport

/// Every type that sould be viewable in the live view as an item must implement this protocol.
public protocol ItemSerializable {
    /// The title displayed as the item, which should be as short as possible. At best, it is just an emoji or consists
    /// of no more than six characters.
    var title: String { get }

    /// The configuration for this item using its `title`.
    var configuration: PlaygroundValue { get }
}

extension ItemSerializable {
    public var configuration: PlaygroundValue {
        return .dictionary([
            "title": .string(title)
        ])
    }
}
