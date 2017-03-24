import SpriteKit

extension Destroyer: Chainable {
    public func attach(to anchor: CGPoint) { }

    public func add(_ item: Item, toLane lane: Int) {
        item.node.run(.scale(to: 0.05, duration: 0.3)) {
            item.node.removeFromParent()
        }
    }
}
