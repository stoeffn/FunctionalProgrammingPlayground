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

    // MARK: - Component

    func process(_ items: [Item?]) {
        for item in items {
            item?.node.run(.scale(by: 0.05, duration: 0.3)) {
                item?.node.removeFromParent()
            }
        }
    }
}
