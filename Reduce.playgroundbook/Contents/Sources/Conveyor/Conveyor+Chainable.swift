import SpriteKit

extension Conveyor: Chainable {
    public func attach(to anchor: CGPoint) {
        node.position = anchor - CGPoint(x: 0, y: length / 2)
    }

    public var outputAnchor: CGPoint {
        return node.position - CGPoint(x: 0, y: length / 2)
    }

    private func xPosition(for item: Item, atLane lane: Int) -> CGFloat {
        let offset = (size.width - item.size.width) / 2 - borderWidth
        return CGFloat(lane) * Constants.conveyerWidth - offset
    }

    private func startPosition(for item: Item, atLane lane: Int) -> CGPoint {
        return node.position + CGPoint(x: xPosition(for: item, atLane: lane), y: length / 2)
    }

    public func add(_ item: Item, toLane lane: Int) {
        item.node.position = startPosition(for: item, atLane: lane)

        let movement = SKAction.move(by: .init(dx: 0, dy: -length), duration: movementDuration(forDistance: length))
        item.node.run(movement) {
            self.output?.add(item, toLane: lane)
        }
    }
}
