import SpriteKit

extension SKNode {
    var absolutePosition: CGPoint {
        return (parent?.absolutePosition ?? .zero) + position
    }
}
