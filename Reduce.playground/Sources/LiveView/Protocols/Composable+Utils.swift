import CoreGraphics
import Foundation

extension Composable {
    var numberOfLanes: Int {
        return items.count
    }

    func xPosition(forLane lane: Int) -> CGFloat {
        return CGFloat(lane - numberOfLanes / 2) * conveyorWidth
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
    default:
        return nil
    }
}
