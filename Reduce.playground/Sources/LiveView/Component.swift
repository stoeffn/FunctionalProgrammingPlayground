import CoreGraphics
import Foundation

protocol Component: Chainable {
    init(numberOfLanes: Int?, _ configuration: [String: PlaygroundValue])

    func activate()

    var numberOfLanes: Int { get }
}

extension Component {
    func xPosition(forLane lane: Int) -> CGFloat {
        return CGFloat(lane - numberOfLanes / 2) * conveyorWidth
    }

    public func startPosition(forLane lane: Int) -> CGPoint {
        return CGPoint(x: xPosition(forLane: lane), y: 0)
    }

    func movementDuration(forDistance distance: CGFloat) -> TimeInterval {
        return abs(Double(distance) / 72)
    }
}

func component(forType type: String) -> Component.Type? {
    switch type.lowercased() {
    case "conveyor":
        return Conveyor.self
    default:
        return nil
    }
}
