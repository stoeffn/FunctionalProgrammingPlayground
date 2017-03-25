import SpriteKit

extension Machine: Chainable {
    var numberOfLanes: Int {
        return components.first?.numberOfLanes ?? 1
    }

    var outputAnchor: CGPoint {
        return components.last?.outputAnchor ?? .zero
    }

    func attach(to anchor: CGPoint) {
        node.position = anchor + CGPoint(x: 0, y: conveyorWidth / 2)
    }

    /*public func add(_ item: Item, toLane lane: Int) {
        item.node.position = node.position + (parts.first?.startPosition(forLane: lane) ?? .zero)
        item.size = CGSize(width: conveyorWidth, height: conveyorWidth)

        node.scene?.addChild(item.node)
        parts.first?.add(item, toLane: lane)
    }*/
}
