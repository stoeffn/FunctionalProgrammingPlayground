import SpriteKit

public class Floor {
    public let node = SKNode()
    let size: CGSize

    // MARK: - Life Cycle

    public init(size: CGSize) {
        self.size = size

        setupTiles()
    }
}
