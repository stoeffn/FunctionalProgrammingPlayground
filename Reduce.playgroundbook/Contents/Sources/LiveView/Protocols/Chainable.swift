import SpriteKit

/// The base protocol for chainable components, providing some default functionality.
protocol Chainable: class {
    /// The component's node that gets displayed in the scene.
    var node: SKNode { get }

    /// The position, which acts as an origin. Used when appending other components.
    var position: CGPoint { get }

    /// The components size, which may or may not be the node's size. Used when appending other components.
    var size: CGSize { get }

    /// A reference to the previous component.
    weak var input: Chainable? { get set }

    /// The relative position from the origin to where the previous component's output anchor is.
    var inputAnchor: CGPoint { get }

    /// A reference to the next component.
    var output: Chainable? { get set }

    /// The relative position from the origin to where the next component's input anchor is.
    var outputAnchor: CGPoint { get }

    func attach(to chainable: Chainable)
}
