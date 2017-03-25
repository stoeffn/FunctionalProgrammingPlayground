import PlaygroundSupport
import SpriteKit

final class Spawner: Composable {
    let node: SKNode = SKNode()
    let items: [Item?]

    weak var input: Chainable?
    var output: Chainable?

    // MARK: - Life Cycle

    init(items: [Item?]? = nil) {
        self.items = items ?? []
    }

    convenience init(_ configuration: [String: PlaygroundValue]) {
        let items = configuration["items"]?
            .array?
            .flatMap { $0.dictionary }
            .map { Item($0) }
        self.init(items: items)
    }

    // MARK: - Component

    func trigger() {
        items
            .enumerated()
            .flatMap { index, item in
                item?.node.position = node.absolutePosition + CGPoint(x: xPosition(forLane: index), y: 0)
                return item?.node
            }
            .forEach { node.scene?.addChild($0) }

        (output as? Composable)?.process(items)
    }
}
