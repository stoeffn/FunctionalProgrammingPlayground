import SpriteKit

extension Machine: Chainable {
    public var numberOfLanes: Int {
        return parts.first?.numberOfLanes ?? 1
    }

    public var outputAnchor: CGPoint {
        return parts.last?.outputAnchor ?? .zero
    }

    public func attach(to anchor: CGPoint) {
        node.position = anchor + CGPoint(x: 0, y: conveyorWidth / 2)
    }

    public func add(_ item: Item, toLane lane: Int) {
        item.size = CGSize(width: conveyorWidth, height: conveyorWidth)

        node.addChild(item.node)
        parts.first?.add(item, toLane: lane)
    }
}
