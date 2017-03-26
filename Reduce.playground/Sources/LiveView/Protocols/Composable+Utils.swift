import CoreGraphics
import Foundation

extension Composable {
    static var typeName: String {
        return String(describing: Self.self)
    }

    func xPosition(forLane lane: Int, numberOfLanes: Int? = nil) -> CGFloat {
        let numberOfLanes = numberOfLanes ?? numberOfInputLanes
        return (CGFloat(lane) - CGFloat(numberOfLanes - 1) / 2) * conveyorWidth
    }

    func absolutePosition(forItemAtLane lane: Int, replacingItem oldItem: Item? = nil, numberOfLanes: Int? = nil) -> CGPoint {
        return CGPoint(x: node.absolutePosition.x + xPosition(forLane: lane, numberOfLanes: numberOfLanes),
                       y: oldItem?.node.absolutePosition.y ?? node.absolutePosition.y)
    }

    func movementDuration(forDistance distance: CGFloat) -> TimeInterval {
        return abs(Double(distance) / 72)
    }
}

func component(forType type: String) -> Composable.Type? {
    switch type.lowercased() {
    case "spawner":
        return Spawner.self
    case "conveyor":
        return Conveyor.self
    case "destroyer":
        return Destroyer.self
    case "filter", "map", "reduce":
        return Operation.self
    default:
        return nil
    }
}
