import SpriteKit

extension Conveyor {
    private var panelTexture: SKTexture {
        guard let image = UIImage(named: "ConveyorPanel") else {
            fatalError("Conveyor panel texture is mising.")
        }
        return SKTexture(image: image)
    }

    private var panelHeight: CGFloat {
        return panelTexture.size().height * 0.8
    }

    private func numberOfPanels(forLength length: CGFloat) -> Int {
        return Int(length / panelHeight) + 1
    }

    private func yPosition(forPanelAt index: Int) -> CGFloat {
        return CGFloat(index) * panelHeight - length / 2
    }

    private var panelAction: SKAction {
        return .repeatForever(.sequence([
            .move(by: CGVector(dx: 0, dy: -panelHeight), duration: movementDuration(forDistance: panelHeight)),
            .move(by: CGVector(dx: 0, dy: panelHeight), duration: 0)
        ]))
    }

    private func panel(for index: Int) -> SKSpriteNode {
        let panel = SKSpriteNode(texture: panelTexture)
        panel.position = CGPoint(x: 0, y: yPosition(forPanelAt: index))
        panel.centerRect = CGRect(x: 0.25, y: 0, width: 0.5, height: 1)
        panel.xScale = (size.width - borderWidth * 2) / panelTexture.size().width
        panel.run(panelAction)
        return panel
    }

    func setupPanels() {
        for index in 0..<numberOfPanels(forLength: length) {
            node.addChild(panel(for: index))
        }
    }
}
