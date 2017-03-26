import SpriteKit

final class Floor {
    let node = SKNode()
    let size: CGSize

    // MARK: - Life Cycle

    public init(size: CGSize) {
        self.size = size

        setupTiles()
    }

    // MARK: - Textures

    let tileTexture = SKTexture(image: #imageLiteral(resourceName: "FloorTile.png"))
}
