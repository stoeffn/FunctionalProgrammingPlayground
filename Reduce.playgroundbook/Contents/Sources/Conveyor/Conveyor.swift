import SpriteKit

public class Conveyor {
    public let node: SKNode = SKCropNode()

    let length: CGFloat
    let numberOfLanes: Int

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

    // MARK: - Helper Methods

    var size: CGSize {
        return .init(width: Constants.conveyerWidth * CGFloat(numberOfLanes) + borderWidth * 2, height: length)
    }

    func movementDuration(forDistance distance: CGFloat) -> TimeInterval {
        return abs(Double(distance) / 128)
    }
}
