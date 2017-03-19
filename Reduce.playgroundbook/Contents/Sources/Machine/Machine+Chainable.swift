import SpriteKit

extension Machine: Chainable {
    public var outputAnchor: CGPoint {
        return parts.last?.outputAnchor ?? .zero
    }

    public func attach(to anchor: CGPoint) {

    }

    public func add(_ item: Item, toLane lane: Int) {
        item.size = CGSize(width: Constants.conveyerWidth, height: Constants.conveyerWidth)

        node.addChild(item.node)
        parts.first?.add(item, toLane: lane)
    }
}
