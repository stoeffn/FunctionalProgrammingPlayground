import SpriteKit

public protocol Chainable: class {
    var node: SKNode { get }

    func attach(to anchor: CGPoint)

    var output: Chainable? { get set }

    var outputAnchor: CGPoint { get }

    func add(_ item: Item, toLane lane: Int)
}
