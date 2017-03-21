import SpriteKit

public class Conveyor {
    public let node: SKNode = SKCropNode()
    public let numberOfLanes: Int
    public let length: CGFloat

    private var panels = [SKSpriteNode]()
    public var output: Chainable?

    // MARK: - Life Cycle

    public init(length: CGFloat = 128, numberOfLanes: Int = 1) {
        self.length = length
        self.numberOfLanes = max(numberOfLanes, 1)

        if let node = node as? SKCropNode {
            node.maskNode = SKSpriteNode(texture: nil, color: .black, size: size)
        }

        setupPanels()
        setupBorder()
    }

    // MARK: - Textures

    let panelTexture = SKTexture(imageNamed: "ConveyorPanel")

    let borderTexture = SKTexture(imageNamed: "ConveyorBorder")

    // MARK: - Helper Methods

    var size: CGSize {
        return CGSize(width: conveyorWidth * CGFloat(numberOfLanes) + borderWidth * 2, height: length)
    }
}
