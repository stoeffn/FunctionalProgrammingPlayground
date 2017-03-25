import SpriteKit

extension SKCropNode {
    convenience init(maskNode: SKNode) {
        self.init()
        self.maskNode = maskNode
    }
}
