import SpriteKit

protocol Bordered: Chainable {
    var borderTexture: SKTexture { get }
}

private enum Side {
    case left, right

    var factor: CGFloat {
        return self == .left ? -1 : 1
    }
}

extension Bordered {
    private func numberOfBorderTiles(forHeight length: CGFloat) -> Int {
        return Int(ceil(length / borderTexture.size().height)) + 1
    }

    private func yPosition(forBorderTileAt index: Int) -> CGFloat {
        return CGFloat(index) * borderTexture.size().height - size.height / 2
    }

    private func borderTile(forSide side: Side, at index: Int) -> SKSpriteNode {
        let border = SKSpriteNode(texture: borderTexture)
        border.position = .init(x: side.factor * (size.width / 2 - borderWidth), y: yPosition(forBorderTileAt: index))
        border.xScale = side.factor
        return border
    }

    var borderWidth: CGFloat {
        return conveyorBorderTexture.size().width / 2
    }

    func setupBorder() {
        for index in 0..<numberOfBorderTiles(forHeight: size.height) {
            node.addChild(borderTile(forSide: .left, at: index))
            node.addChild(borderTile(forSide: .right, at: index))
        }
    }
}
