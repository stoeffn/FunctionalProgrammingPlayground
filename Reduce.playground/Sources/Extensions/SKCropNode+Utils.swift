import SpriteKit

extension SKCropNode {
    /// Created a new crop node using the mask node given.
    convenience init(maskNode: SKNode) {
        self.init()
        self.maskNode = maskNode
    }
}
