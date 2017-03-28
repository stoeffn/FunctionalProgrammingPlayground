import PlaygroundSupport
import SpriteKit

final class Spawner: Composable {
    let node: SKNode = SKNode()

    weak var input: Chainable?
    var output: Chainable?
    var numberOfInputLanes: Int
    var items: [Int: Item]

    // MARK: - Life Cycle

    init(items: [Int: Item]?) {
        self.items = items ?? [:]
        self.numberOfInputLanes = (items?.keys.max() ?? 0) + 1
    }

    convenience init(_ configuration: Configuration) {
        let items = Item.multipleFrom(configuration: configuration["items"]?.dictionary)
        self.init(items: items)
    }

    // MARK: - Configuration

    static func configuration(forItems items: [Int: ItemConvertible]) -> PlaygroundValue {
        return .dictionary([
            "type": .string(typeName),
            "items": .dictionary(items.mapPairs { (String($0), $1.configuration) })
        ])
    }

    // MARK: - Component

    func trigger() {
        items
            .map { lane, item in
                item.node.position = absolutePosition(forItemAtLane: lane)
                return item.node
            }
            .forEach { node.scene?.addChild($0) }

        let outputComponent = output as? Composable
        outputComponent?.process(items)
        items.removeAll()
    }

    // MARK: - Helpers

    static func dummy(numberOfLanes: Int = 1) -> Spawner {
        let items = Array(0..<numberOfLanes)
            .map { ($0, Item(title: ":/")) }
        return Spawner(items: Dictionary(items))
    }
}
