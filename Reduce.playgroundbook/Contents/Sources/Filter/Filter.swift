import SpriteKit

/*public class Filter: SKSpriteNode {
    let direction: Direction
    let isIncluded: (Item) -> Bool

    public init(direction: Direction = .right, _ isIncluded: @escaping (Item) -> Bool) {
        self.direction = direction
        self.isIncluded = isIncluded
        let size = CGSize(width: Constants.conveyerHeight, height: Constants.conveyerHeight * 3)
        super.init(texture: nil, color: .gray, size: size)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public var output: Chainable?
}

extension Filter: Chainable {
    public func setAnchor(_ anchor: CGPoint) {
        position = anchor - CGPoint(x: 0, y: Constants.conveyerHeight)
    }

    public var outputAnchor: CGPoint {
        return position - CGPoint(x: 0, y: Constants.conveyerHeight)
    }

    public var trashAnchor: CGPoint {
        return position + CGPoint(x: direction.xFactor * 256, y: Constants.conveyerHeight)
    }

    public func startPosition(for item: Item) -> CGPoint {
        return .zero
    }

    public func add(_ item: Item) {
        let action = isIncluded(item) ? moveToOutputAction(item) : moveToTrashAction(item)
        item.run(action)
    }

    public func moveToOutputAction(_ item: Item) -> SKAction {
        return .sequence([
            .move(to: outputAnchor, duration: 1),
            .run { self.output?.add(item) }
        ])
    }

    public func moveToTrashAction(_ item: Item) -> SKAction {
        return .sequence([
            .move(to: trashAnchor, duration: 1),
            .removeFromParent()
        ])
    }
}*/
