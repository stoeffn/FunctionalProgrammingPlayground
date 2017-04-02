import CoreGraphics
import PlaygroundSupport

/// Configuration type for machine components.
public typealias Configuration = [String: PlaygroundValue]

// Originally, I wanted the following functions to live in a `Configuration` extension. Unfortunately,
// `extension Dictionary where Key: String, Value: PlaygroundValue` seems to crash the compiler.

/// The configuration for a spawner with certain items.
func spawner(with items: [Int: ItemSerializable]) -> Configuration {
    return [
        "type": .string(String(describing: Spawner.self)),
        "items": .dictionary(items.mapPairs { (String($0), $1.configuration) })
    ]
}

/// The configuration for a conveyor with an optional length.
func conveyor(withLength length: CGFloat = conveyorWidth) -> Configuration {
    return [
        "type": .string(String(describing: Conveyor.self)),
        "length": .floatingPoint(Double(length))
    ]
}

/// The configuration for an operation like `filter`, `map`, or `reduce` that results in the items given.
func operation(with items: [Int: ItemSerializable], method: Operation.Method) -> Configuration {
    return [
        "type": .string(method.rawValue),
        "items": .dictionary(items.mapPairs { (String($0), $1.configuration) })
    ]
}

/// Configuration for a bin that "holds" items.
public var bin: Configuration {
    return [
        "type": .string(String(describing: Bin.self))
    ]
}
