import SpriteKit

extension Machine: Chainable {
    public var numberOfLanes: Int {
        return parts.first?.numberOfLanes ?? 1
    }

    public var outputAnchor: CGPoint {
        return parts.last?.outputAnchor ?? .zero
    }

    public func attach(to anchor: CGPoint) { }

    public func add(_ item: Item, toLane lane: Int) {
        item.size = CGSize(width: conveyerWidth, height: conveyerWidth)

        node.addChild(item.node)
        parts.first?.add(item, toLane: lane)
    }
}
