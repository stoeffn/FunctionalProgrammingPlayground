import PlaygroundSupport
import SpriteKit

final class Bin: Composable {
    let node: SKNode = SKNode()

    weak var input: Chainable?
    var output: Chainable?
    var items: [Int : Item] = [:]

    // MARK: - Life Cycle

    init() { }

    convenience init(_ configuration: Configuration) {
        self.init()
    }

    deinit {
        items.values.forEach(remove)
    }

    // MARK: - Chainable

    var size: CGSize {
        return CGSize(width: conveyorWidth * CGFloat(numberOfInputLanes), height: conveyorWidth)
    }

    // MARK: - Component

    func updateAppearance() {
        node.removeAllChildren()

        node.addChild(binNode)
    }

    func process(_ items: [Int: Item]) {
        self.items = items

        let distance = conveyorWidth / 2
        let duration = movementDuration(forDistance: distance)
        let movement = SKAction.move(by: CGVector(dx: 0, dy: -distance), duration: duration)
        items.values.forEach { $0.node.run(movement) }
    }

    // MARK: - Nodes

    private lazy var binNode: SKSpriteNode = {
        let node = SKSpriteNode(texture: binTexture)
        node.centerRect = CGRect(x: 0.4, y: 0, width: 0.2, height: 1)
        node.xScale = (self.size.width + 32) / binTexture.size().width
        node.yScale = self.size.height / binTexture.size().height
        return node
    }()

    // MARK: - Helpers

    private func remove(_ item: Item) {
        item.node.run(.scale(by: 0.05, duration: 0.3)) {
            item.node.removeFromParent()
        }
    }
}
