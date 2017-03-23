import SpriteKit

public protocol Chainable: class {
    var node: SKNode { get }

    var numberOfLanes: Int { get }

    func attach(to anchor: CGPoint)

    var output: Chainable? { get set }

    var outputAnchor: CGPoint { get }

    func startPosition(forLane lane: Int) -> CGPoint

    func add(_ item: Item, toLane lane: Int)
}

extension Chainable {
    func xPosition(forLane lane: Int) -> CGFloat {
        return CGFloat(lane - numberOfLanes / 2) * conveyorWidth
    }

    public func startPosition(forLane lane: Int) -> CGPoint {
        return CGPoint(x: xPosition(forLane: lane), y: 0)
    }

    func movementDuration(forDistance distance: CGFloat) -> TimeInterval {
        return abs(Double(distance) / 72)
    }

    public var outputAnchor: CGPoint {
        return .zero
    }
}
