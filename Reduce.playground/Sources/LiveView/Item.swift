import SpriteKit

public class Item {
    let node = SKNode()

    public lazy var label = SKLabelNode()

    public init(text: String) {
        label.text = text
        node.addChild(label)
    }

    var size: CGSize = .zero {
        didSet {
            label.fontSize = size.height * 0.6
            label.verticalAlignmentMode = .center
        }
    }
}
