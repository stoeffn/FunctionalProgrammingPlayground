import SpriteKit

extension Filter: Chainable {
    public func attach(to anchor: CGPoint) {
        node.position = anchor - CGPoint(x: 0, y: conveyorWidth / 2)
    }

    public var outputAnchor: CGPoint {
        return node.position - CGPoint(x: 0, y: conveyorWidth / 2)
    }

    private func startPosition(forLane lane: Int) -> CGPoint {
        return node.position + CGPoint(x: xPosition(forLane: lane), y: conveyorWidth / 2)
    }

    private func pulseAction(for color: UIColor) -> SKAction {
        return .sequence([
            .colorize(with: color, colorBlendFactor: 1, duration: 0.1),
            .wait(forDuration: 0.7),
            .colorize(withColorBlendFactor: 0.0, duration: 0.2)
        ])
    }

    public func add(_ item: Item, toLane lane: Int) {
        item.node.position = startPosition(forLane: lane)

        let isItemIncluded = isIncluded(item)
        let movement = SKAction.move(by: CGVector(dx: 0, dy: -conveyorWidth / 2), duration: movementDuration(forDistance: conveyorWidth / 2))
        let excludeMovement = SKAction.move(by: CGVector(dx: 512, dy: 0), duration: movementDuration(forDistance: 512))

        indicators[lane].run(pulseAction(for: isItemIncluded ? greenIndicator : redIndicator))

        item.node.run(.sequence([
            movement,
            isItemIncluded ? movement : excludeMovement
        ])) {
            self.didProcessItem(item, atLane: lane, included: isItemIncluded)
        }
    }

    private func didProcessItem(_ item: Item, atLane lane: Int, included isItemIncluded: Bool) {
        if isItemIncluded {
            self.output?.add(item, toLane: lane)
        } else {
            item.node.removeFromParent()
        }
    }
}
