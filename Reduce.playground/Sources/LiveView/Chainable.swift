import SpriteKit

protocol Chainable: class {
    var node: SKNode { get }

    func attach(to anchor: CGPoint)

    var output: Chainable? { get set }

    var outputAnchor: CGPoint { get }
}

extension Chainable {
    public var outputAnchor: CGPoint {
        return .zero
    }
}
