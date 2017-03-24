import SpriteKit

extension Map: Chainable {
    public func attach(to anchor: CGPoint) {
        node.position = anchor - CGPoint(x: 0, y: conveyorWidth / 2)
    }

    public var outputAnchor: CGPoint {
        return node.position - CGPoint(x: 0, y: conveyorWidth / 2)
    }

    public func startPosition(forLane lane: Int) -> CGPoint {
        return node.position + CGPoint(x: xPosition(forLane: lane), y: conveyorWidth / 2)
    }

    public func add(_ item: Item, toLane lane: Int) {
        let transformedItem = transform(item)
        let movement = SKAction.move(by: CGVector(dx: 0, dy: -conveyorWidth / 2), duration: movementDuration(forDistance: conveyorWidth / 2))

        item.node.run(movement) {
            let position = item.node.position
            self.node.scene?.addChild(transformedItem.node)
            item.node.removeFromParent()
            transformedItem.node.position = position
            transformedItem.node.run(movement) {
                self.output?.add(transformedItem, toLane: lane)
            }
        }
    }
}
