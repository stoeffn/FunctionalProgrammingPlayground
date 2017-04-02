import SpriteKit

extension SKNode {
    /// The node's absolute position in the scene.
    var absolutePosition: CGPoint {
        return (parent?.absolutePosition ?? .zero) + position
    }
}
