import SpriteKit

extension Destroyer: Chainable {
    public func attach(to anchor: CGPoint) { }

    public var outputAnchor: CGPoint {
        return .zero
    }

    public func add(_ item: Item, toLane lane: Int) {
        item.node.removeFromParent()
    }
}
