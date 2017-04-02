import PlaygroundSupport
import SpriteKit

/// Represents an item (e.g. food) that can be transported on a conveyor or operated on.
final class Item {
    let node = SKNode()

    // MARK: - Life Cycle

    init(title: String) {
        label.text = title
        label.fontSize = fontSize(forTextLength: title.characters.count)
        label.verticalAlignmentMode = .center
        node.addChild(label)
    }

    convenience init?(_ configuration: Configuration?) {
        guard let title = configuration?["title"]?.string else { return nil }
        self.init(title: title)
    }

    // MARK: - Nodes

    lazy var label = SKLabelNode(fontNamed: "Menlo-Bold")

    // MARK: - Helpers

    /// Converts a dictionary of item configurations to an array of items.
    static func multipleFrom(configuration: Configuration?) -> [Int: Item] {
        return (configuration ?? [:])
            .mapPairs { (Int($0)!, Item($1.dictionary)) }
            .filterPairs { $1 != nil }
            .mapPairs { ($0, $1!) }
    }

    var size: CGSize {
        return CGSize(width: conveyorWidth, height: conveyorWidth)
    }

    func fontSize(forTextLength textLength: Int) -> CGFloat {
        switch textLength {
        case 0...1: return size.height * 0.6
        case 2...4: return size.height * 0.4
        default: return size.height * 0.2
        }
    }
}
