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

    convenience init?(_ configuration: [String: PlaygroundValue]) {
        guard let title = configuration["title"]?.string else { return nil }
        self.init(title: title)
    }

    // MARK: - Nodes

    lazy var label = SKLabelNode()

    // MARK: - Helpers

    var size: CGSize {
        return CGSize(width: conveyorWidth, height: conveyorWidth)
    }
}
