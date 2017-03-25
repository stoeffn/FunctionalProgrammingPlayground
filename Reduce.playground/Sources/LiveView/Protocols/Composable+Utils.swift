import CoreGraphics
import Foundation

extension Composable {
    var numberOfLanes: Int {
        return items.count
    }

    func xPosition(forLane lane: Int) -> CGFloat {
        return CGFloat(lane - numberOfLanes / 2) * conveyorWidth
    }

    func absolutePosition(forItemAtLane lane: Int, replacingItem oldItem: Item? = nil) -> CGPoint {
        return CGPoint(x: node.absolutePosition.x + xPosition(forLane: lane),
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
