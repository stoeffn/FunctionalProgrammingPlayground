import SpriteKit

extension Floor {
    private var tileTexture: SKTexture {
        guard let image = UIImage(named: "FloorTile") else {
            fatalError("Floor tile texture is mising.")
        }
        return SKTexture(image: image)
    }

    private func position(forTileAtX x: Int, y: Int) -> CGPoint {
        let offset = CGPoint(x: tileTexture.size().width, y: tileTexture.size().height) / 2
        return CGPoint(x: CGFloat(x) * tileTexture.size().width, y: CGFloat(y) * tileTexture.size().height) + offset
    }

    private func floorTile(atX x: Int, y: Int) -> SKSpriteNode {
        let tile = SKSpriteNode(texture: tileTexture)
        tile.position = position(forTileAtX: x, y: y)
        return tile
    }

    func setupTiles() {
        let numberOfHorizontalTiles = Int(ceil(size.width / tileTexture.size().width))
        let numberOfVerticalTiles = Int(ceil(size.height / tileTexture.size().height))

        for x in 0..<numberOfHorizontalTiles {
            for y in 0..<numberOfVerticalTiles {
                node.addChild(floorTile(atX: x, y: y))
            }
        }
    }
}
