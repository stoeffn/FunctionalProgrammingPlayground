import SpriteKit

protocol Chainable: class {
    var node: SKNode { get }

    weak var input: Chainable? { get set }

    var position: CGPoint { get }

    var size: CGSize { get }

    var inputAnchor: CGPoint { get }

    var output: Chainable? { get set }

    var outputAnchor: CGPoint { get }

    func attach(to chainable: Chainable)
}
