import PlaygroundSupport
import SpriteKit

final class Item {
    let node = SKNode()

    // MARK: - Life Cycle

    init(title: String) {
        label.text = title
        label.fontSize = size.height * 0.6
        label.verticalAlignmentMode = .center
        node.addChild(label)
    }

    convenience init?(_ configuration: Conf?) {
        guard let title = configuration?["title"]?.string else { return nil }
        self.init(title: title)
    }

    // MARK: - Nodes

    lazy var label = SKLabelNode(fontNamed: "Menlo-Bold")

    // MARK: - Helpers

    static func multipleFrom(configuration: [String: PlaygroundValue]?) -> [Int: Item]? {
        return configuration?
            .mapPairs { (Int($0)!, Item($1.dictionary)) }
            .filterPairs { $1 != nil }
            .mapPairs { ($0, $1!) }
    }

    var size: CGSize {
        return CGSize(width: conveyorWidth, height: conveyorWidth)
    }
}
