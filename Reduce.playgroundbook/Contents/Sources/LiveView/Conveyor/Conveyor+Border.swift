import SpriteKit

extension Conveyor {
    private enum Side {
        case left, right

        var factor: CGFloat {
            return self == .left ? -1 : 1
        }
    }

    private func numberOfBorderTiles(forLength length: CGFloat) -> Int {
        return Int(ceil(length / borderTexture.size().height)) + 1
    }

    private func yPosition(forBorderTileAt index: Int) -> CGFloat {
        return CGFloat(index) * borderTexture.size().height - length / 2
    }

    private func borderTile(forSide side: Side, at index: Int) -> SKSpriteNode {
        let border = SKSpriteNode(texture: borderTexture)
        border.position = .init(x: side.factor * (size.width / 2 - borderWidth), y: yPosition(forBorderTileAt: index))
        border.xScale = side.factor
        return border
    }

    var borderWidth: CGFloat {
        return borderTexture.size().width / 2
    }

    func setupBorder() {
        for index in 0..<numberOfBorderTiles(forLength: length) {
            node.addChild(borderTile(forSide: .left, at: index))
            node.addChild(borderTile(forSide: .right, at: index))
        }
    }
}
