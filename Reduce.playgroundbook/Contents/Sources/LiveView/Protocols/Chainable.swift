import SpriteKit

/// The base protocol for chainable components, providing some default functionality.
protocol Chainable: class {
    /// The component's node that gets displayed in the scene.
    var node: SKNode { get }

    /// The position, which acts as an origin. Used when appending other components.
    var position: CGPoint { get }

    /// The components size, which may or may not be the node's size. Used when appending other components.
    ///
    /// Defaults to zero.
    var size: CGSize { get }

    /// A reference to the previous component.
    weak var input: Chainable? { get set }

    /// The relative position from the origin to where the previous component's output anchor is.
    ///
    /// Defaults to the top, centered horizontally and depending on the size.
    var inputAnchor: CGPoint { get }

    /// A reference to the next component.
    var output: Chainable? { get set }

    /// The relative position from the origin to where the next component's input anchor is.
    ///
    /// Defaults to the bottom, centered horizontally and depending on the size.
    var outputAnchor: CGPoint { get }

    /// Positions this component in a way that its input anchor's position matches the given component's output anchor
    /// position.
    func attach(to chainable: Chainable)
}
