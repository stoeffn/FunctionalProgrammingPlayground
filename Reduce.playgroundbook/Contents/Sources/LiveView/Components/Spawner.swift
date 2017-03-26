import PlaygroundSupport
import SpriteKit

final class Spawner: Composable {
    let node: SKNode = SKNode()

    weak var input: Chainable?
    var output: Chainable?
    var items: [Item?]

    // MARK: - Life Cycle

    init(items: [Item?]?) {
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
            .flatMap { lane, item in
                item?.node.position = absolutePosition(forItemAtLane: lane)
                return item?.node
            }
            .forEach { node.scene?.addChild($0) }

        let outputComponent = output as? Composable
        outputComponent?.process(items)
        items.removeAll()
    }
}
