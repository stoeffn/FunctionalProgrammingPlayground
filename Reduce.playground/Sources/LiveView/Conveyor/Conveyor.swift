import PlaygroundSupport
import SpriteKit

final class Conveyor: Component {
    let node: SKNode = SKCropNode()
    let numberOfLanes: Int
    let length: CGFloat

    var output: Chainable?

    // MARK: - Life Cycle

    init(numberOfLanes: Int? = nil, length: CGFloat? = nil) {
        self.numberOfLanes = max(numberOfLanes ?? 1, 1)
        self.length = length ?? conveyorWidth

        if let node = node as? SKCropNode {
            node.maskNode = SKSpriteNode(texture: nil, color: .black, size: size)
        }

        setupPanels()
        setupBorder()
    }

    convenience init(numberOfLanes: Int? = nil, _ configuration: [String: PlaygroundValue]) {
        self.init(
            numberOfLanes: numberOfLanes,
            length: configuration["length"]?.cgFloat)
    }

    // MARK: - Component

    func activate() {

    }

    // MARK: - Textures

    let panelTexture = SKTexture(imageNamed: "ConveyorPanel")

    let borderTexture = SKTexture(imageNamed: "ConveyorBorder")

    // MARK: - Helper Methods

    var size: CGSize {
        return CGSize(width: conveyorWidth * CGFloat(numberOfLanes) + borderWidth * 2, height: length)
    }
}
