import SpriteKit

public protocol Chainable: class {
    var node: SKNode { get }

    var numberOfLanes: Int { get }

    func attach(to anchor: CGPoint)

    var output: Chainable? { get set }

    var outputAnchor: CGPoint { get }

    func add(_ item: Item, toLane lane: Int)
}

extension Chainable {
    func xPosition(forLane lane: Int) -> CGFloat {
        return CGFloat(lane - numberOfLanes / 2) * conveyorWidth
    }
}
