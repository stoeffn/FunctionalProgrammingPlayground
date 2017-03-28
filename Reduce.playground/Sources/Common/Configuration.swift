import CoreGraphics
import PlaygroundSupport

public typealias Configuration = [String: PlaygroundValue]

// BUG: extension Dictionary where Key: String, Value: PlaygroundValue

func spawner(with items: [Int: ItemSerializable]) -> Configuration {
    return [
        "type": .string(String(describing: Spawner.self)),
        "items": .dictionary(items.mapPairs { (String($0), $1.configuration) })
    ]
}

func conveyor(withLength length: CGFloat = conveyorWidth) -> Configuration {
    return [
        "type": .string(String(describing: Conveyor.self)),
        "length": .floatingPoint(Double(length))
    ]
}

func operation(with items: [Int: ItemSerializable], method: Operation.Method) -> Configuration {
    return [
        "type": .string(method.rawValue),
        "items": .dictionary(items.mapPairs { (String($0), $1.configuration) })
    ]
}

public var destroyer: Configuration {
    return [
        "type": .string(String(describing: Destroyer.self))
    ]
}
