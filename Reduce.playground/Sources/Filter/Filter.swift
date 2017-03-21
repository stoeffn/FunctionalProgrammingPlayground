import SpriteKit

public class Filter {
    public let node: SKNode = SKNode()
    public let numberOfLanes: Int
    public let isIncluded: (Item) -> Bool

    public var output: Chainable?

    var indicators = [SKSpriteNode]()

    // MARK: - Life Cycle

    public init(numberOfLanes: Int = 1, description: String, isIncluded: @escaping (Item) -> Bool) {
        self.numberOfLanes = max(numberOfLanes, 1)
        self.isIncluded = isIncluded

        node.addChild(casingNode)
        node.addChild(exclusionConveyor.node)
        node.addChild(labelNode)

        labelNode.text = ".filter(\(description))"

        for lane in 0..<numberOfLanes {
            let indicator = self.indicator(forLane: lane)
            indicators.append(indicator)
            node.addChild(indicator)
        }
    }

    // MARK: - Textures

    let casingTexture = SKTexture(imageNamed: "Filter")

    let indicatorTexture = SKTexture(imageNamed: "Indicator")

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

    private lazy var exclusionConveyor: Conveyor = {
        let conveyor = Conveyor(length: 256, numberOfLanes: 1)
        conveyor.node.position = CGPoint(x: self.size.width / 2 + 128, y: 0)
        conveyor.node.zRotation = .pi / 2
        return conveyor
    }()

    private func indicator(forLane lane: Int) -> SKSpriteNode {
        let indicator = SKSpriteNode(texture: indicatorTexture)
        indicator.position = CGPoint(x: xPosition(forLane: lane), y: (size.height - indicatorTexture.size().height) / 2)
        indicator.zPosition = 1
        indicator.alpha = 0.9
        return indicator
    }

    // MARK: - Helper Methods

    var size: CGSize {
        return CGSize(width: conveyorWidth * CGFloat(numberOfLanes), height: conveyorWidth)
    }
}
