import SpriteKit

extension Reduce: Chainable {
    public func attach(to anchor: CGPoint) {
        node.position = anchor - CGPoint(x: 0, y: conveyorWidth / 2)
    }

    public var outputAnchor: CGPoint {
        return node.position - CGPoint(x: 0, y: conveyorWidth / 2)
    }

    public func startPosition(forLane lane: Int) -> CGPoint {
        return node.position + CGPoint(x: xPosition(forLane: lane), y: conveyorWidth / 2)
    }

    private var itemMovement: SKAction {
        return .move(by: CGVector(dx: 0, dy: -conveyorWidth / 2), duration: movementDuration(forDistance: conveyorWidth / 2))
    }

    public func add(_ item: Item, toLane lane: Int) {
        item.node.run(itemMovement) {
            item.node.removeFromParent()

            self.collectedItems.append(item)
            self.collectionTimer?.invalidate()
            self.collectionTimer = .scheduledTimer(timeInterval: 0.01, target: self,
                                                   selector: #selector(self.processItems), userInfo: nil, repeats: false)
        }
    }

    private dynamic func processItems() {
        let reducedItem = collectedItems.reduce(initialResult, nextPartialResult)
        reducedItem.node.position = node.absolutePosition + CGPoint(x: xPosition(forLane: Int(numberOfLanes / 2)), y: 0)
        node.scene?.addChild(reducedItem.node)

        collectedItems.removeAll()

        reducedItem.node.run(itemMovement) {
            self.output?.add(reducedItem, toLane: 0)
        }
    }
}
