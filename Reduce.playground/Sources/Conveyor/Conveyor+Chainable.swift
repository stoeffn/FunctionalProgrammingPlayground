import SpriteKit

extension Conveyor: Chainable {
    public func attach(to anchor: CGPoint) {
        node.position = anchor - CGPoint(x: 0, y: length / 2)
    }

    public var outputAnchor: CGPoint {
        return node.position - CGPoint(x: 0, y: length / 2)
    }

    private func startPosition(forLane lane: Int) -> CGPoint {
        return node.position + CGPoint(x: xPosition(forLane: lane), y: length / 2)
    }

    public func add(_ item: Item, toLane lane: Int) {
        item.node.position = startPosition(forLane: lane)

        let movement = SKAction.move(by: CGVector(dx: 0, dy: -length), duration: movementDuration(forDistance: length))
        item.node.run(movement) {
            self.output?.add(item, toLane: lane)
        }
    }
}
