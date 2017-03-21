import SpriteKit

public class Machine {
    public let node = SKNode()

    public var output: Chainable?
    private(set) var parts = [Chainable]()

    public init(parts: [Chainable]) {
        parts.forEach(add)
    }

    public func add(_ part: Chainable) {
        part.attach(to: parts.last?.outputAnchor ?? node.position)

        parts.last?.output = part
        parts.append(part)
        node.addChild(part.node)
    }
}
