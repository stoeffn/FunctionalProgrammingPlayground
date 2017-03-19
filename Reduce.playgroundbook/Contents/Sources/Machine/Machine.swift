import SpriteKit

public class Machine {
    public let node = SKNode()

    public var output: Chainable?
    private(set) var parts = [Chainable]()
    private var anchor: CGPoint

    public init(anchor: CGPoint = .zero, parts: [Chainable]) {
        self.anchor = anchor

        parts.forEach(add)
    }

    public func add(_ part: Chainable) {
        part.attach(to: parts.last?.outputAnchor ?? anchor)

        parts.last?.output = part
        parts.append(part)
        node.addChild(part.node)
    }
}
