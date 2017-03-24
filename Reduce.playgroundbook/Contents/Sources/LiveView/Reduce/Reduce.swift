import SpriteKit

public class Reduce {
    public let node: SKNode = SKNode()
    public let numberOfLanes: Int
    public let initialResult: Item
    public let nextPartialResult: (Item, Item) -> Item

    public var output: Chainable?

    var collectionTimer: Timer?
    var collectedItems = [Item]()

    // MARK: - Life Cycle

    public init(numberOfLanes: Int = 1, description: String, initialResult: Item? = nil,
                nextPartialResult: @escaping (Item, Item) -> Item) {
        self.numberOfLanes = max(numberOfLanes, 1)
        self.initialResult = initialResult ?? Item(text: "")
        self.nextPartialResult = nextPartialResult

        node.addChild(casingNode)
        node.addChild(labelNode)

        labelNode.text = ".reduce(\(description))"
    }

    // MARK: - Textures

    let casingTexture = SKTexture(imageNamed: "Reduce")

    // MARK: - Nodes

    private lazy var casingNode: SKSpriteNode = {
        let node = SKSpriteNode(texture: self.casingTexture)
        node.centerRect = CGRect(x: 0.4, y: 0, width: 0.2, height: 1)
        node.xScale = (self.size.width + 32) / self.casingTexture.size().width
        node.yScale = self.size.height / self.casingTexture.size().height
        node.zPosition = 1
        return node
    }()

    private lazy var labelNode: SKLabelNode = {
        let label = SKLabelNode(fontNamed: "Menlo-Bold")
        label.verticalAlignmentMode = .center
        label.color = .white
        label.fontSize = self.size.height / 4
        label.zPosition = 1
        return label
    }()

    // MARK: - Helper Methods

    var size: CGSize {
        return CGSize(width: conveyorWidth * CGFloat(numberOfLanes), height: conveyorWidth)
    }
}
