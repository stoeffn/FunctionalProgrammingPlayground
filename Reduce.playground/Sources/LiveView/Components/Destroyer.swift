import PlaygroundSupport
import SpriteKit

final class Destroyer: Composable {
    let node: SKNode = SKNode()

    weak var input: Chainable?
    var output: Chainable?

    // MARK: - Life Cycle

    init() { }

    convenience init(_ configuration: [String: PlaygroundValue]) {
        self.init()
    }

    // MARK: - Configuration

    static var configuration: PlaygroundValue {
        return .dictionary([
            "type": .string(typeName)
        ])
    }

    // MARK: - Component

    func process(_ items: [Int: Item]) {
        items.values.forEach(remove)
    }

    private func remove(_ item: Item) {
        item.node.run(.scale(by: 0.05, duration: 0.3)) {
            item.node.removeFromParent()
        }
    }
}
