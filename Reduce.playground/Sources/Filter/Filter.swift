import SpriteKit

public class Filter {
    public let node: SKNode = SKNode()
    public let numberOfLanes: Int

    public var output: Chainable?

    var indicators = [SKSpriteNode]()

    // MARK: - Life Cycle

    public init(numberOfLanes: Int = 1) {
        self.numberOfLanes = max(numberOfLanes, 1)

        let texture = SKTexture(image: UIImage(named: "Filter")!)
        let box = SKSpriteNode(texture: texture)
        box.centerRect = CGRect(x: 0.4, y: 0, width: 0.2, height: 1)
        box.xScale = (size.width + 32) / texture.size().width
        box.yScale = size.height / texture.size().height
        box.zPosition = 1
        node.addChild(box)

        let exlusionConveyor = Conveyor(length: 256, numberOfLanes: 1)
        exlusionConveyor.node.position = CGPoint(x: size.width / 2 + 128, y: 0)
        exlusionConveyor.node.zRotation = .pi / 2
        node.addChild(exlusionConveyor.node)

        let label = SKLabelNode(fontNamed: "Menlo-Bold")
        label.verticalAlignmentMode = .center
        label.text = ".filter(isHappy)"
        label.color = .white
        label.fontSize = 18
        label.zPosition = 1
        node.addChild(label)

        for index in 0..<numberOfLanes {
            let indicatorTexture = SKTexture(image: UIImage(named: "Indicator")!)
            let indicator = SKSpriteNode(texture: indicatorTexture)
            indicator.position = CGPoint(x: xPosition(forLane: index), y: (texture.size().height - indicatorTexture.size().height) / 2)
            indicator.zPosition = 1
            indicator.alpha = 0.9

            indicators.append(indicator)
            node.addChild(indicator)
        }
    }

    // MARK: - Helper Methods

    var size: CGSize {
        return CGSize(width: conveyerWidth * CGFloat(numberOfLanes), height: conveyerWidth)
    }
}
