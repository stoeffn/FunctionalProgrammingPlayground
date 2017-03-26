import PlaygroundSupport
import SpriteKit

final class Operation: Composable {
    enum Method: String {
        case none, filter, map, reduce
    }

    let node: SKNode = SKCropNode()
    let method: Method
    let description: String

    private let removalConveyorLength: CGFloat = 512

    weak var input: Chainable?
    var output: Chainable?
    var items: [Int: Item]

    // MARK: - Life Cycle

    init(method: Method?, items: [Int: Item]?, description: String? = nil) {
        self.method = method ?? .none
        self.items = items ?? [:]
        self.description = description ?? ""
    }

    convenience init(_ configuration: [String: PlaygroundValue]) {
        let method = Method(rawValue: configuration["type"]?.string?.lowercased() ?? "")
        let items = Item.multipleFrom(configuration: configuration["items"]?.dictionary)
        let description = configuration["description"]?.string
        self.init(method: method, items: items, description: description)
    }

    // MARK: - Configuration

    static func configuration(forItems items: [Int: ItemConvertible], method: Method) -> PlaygroundValue {
        return .dictionary([
            "type": .string(method.rawValue),
            "items": .dictionary(items.mapPairs { (String($0), $1.configuration) })
        ])
    }

    // MARK: - Chainable

    var inputAnchor: CGPoint {
        return CGPoint(x: 0, y: conveyorWidth / 2)
    }

    var outputAnchor: CGPoint {
        return -CGPoint(x: 0, y: conveyorWidth / 2)
    }

    // MARK: - Component

    func updateAppearance() {
        node.removeAllChildren()

        labelNode.text = ".\(method)(\(description))"

        node.addChild(casingNode)
        node.addChild(labelNode)

        if method == .filter {
            node.addChild(removalConveyor.node)
            indicators.forEach { node.addChild($0) }
        }
    }

    func process(_ items: [Int: Item]) {
        items.forEach(processItem)
    }

    private func processItem(inLane lane: Int, _ oldItem: Item?) {
        guard let oldItem = oldItem else { return }

        let duration = movementDuration(forDistance: size.height)
        let movement = SKAction.move(by: CGVector(dx: 0, dy: -size.height / 2), duration: duration / 2)
        let hasItemChanged = items[lane] ?? nil != oldItem
        let shouldAnimateRemoval = method == .filter && hasItemChanged

        if method == .filter {
            indicators[lane].run(pulseAction(for: hasItemChanged ? redIndicator : greenIndicator))
        }

        oldItem.node.run(movement) {
            guard let newItem = self.replacingItem(atLane: lane, oldItem, animated: shouldAnimateRemoval) else { return }
            newItem.node.run(movement)
        }

        Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { _ in
            (self.output as? Composable)?.process(self.items)
            self.items.removeAll()
        }
    }

    private func replacingItem(atLane lane: Int, _ oldItem: Item, animated: Bool) -> Item? {
        defer { remove(oldItem, animated: animated) }
        guard let newItem = items[lane] ?? nil else { return nil }

        newItem.node.position = absolutePosition(forItemAtLane: lane, replacingItem: oldItem)
        oldItem.node.scene?.addChild(newItem.node)
        return newItem
    }

    private func remove(_ item: Item, animated: Bool) {
        let distance = size.width / 2 + item.node.position.x + removalConveyorLength
        let duration = animated ? movementDuration(forDistance: distance) : 0
        let movement = SKAction.move(by: CGVector(dx: 512, dy: 0), duration: duration)

        item.node.run(movement) {
            item.node.removeFromParent()
        }
    }

    // MARK: - Textures

    var casingTexture: SKTexture {
        return SKTexture(imageNamed: method.rawValue.capitalized)
    }

    let indicatorTexture = SKTexture(image: #imageLiteral(resourceName: "Indicator.png"))

    // MARK: - Nodes

    private lazy var casingNode: SKSpriteNode = {
        let node = SKSpriteNode(texture: self.casingTexture)
        node.centerRect = CGRect(x: 0.4, y: 0, width: 0.2, height: 1)
        node.xScale = (self.size.width + 32) / self.casingTexture.size().width
        node.yScale = self.size.height / self.casingTexture.size().height
        node.zPosition = 1
        return node
    }()

    private lazy var labelNode: SKLabelNode = {
        let label = SKLabelNode(fontNamed: "Menlo-Bold")
        label.verticalAlignmentMode = .center
        label.color = .white
        label.fontSize = self.size.height / 4
        label.zPosition = 1
        return label
    }()

    private lazy var removalSpawner = Spawner.dummy()

    private lazy var removalConveyor: Conveyor = {
        let conveyor = Conveyor(length: 256)
        conveyor.input = self.removalSpawner
        conveyor.node.position = CGPoint(x: self.size.width / 2 + 128, y: 0)
        conveyor.node.zRotation = .pi / 2
        conveyor.updateAppearance()
        return conveyor
    }()

    private func indicator(forLane lane: Int) -> SKSpriteNode {
        let indicator = SKSpriteNode(texture: indicatorTexture)
        indicator.position = CGPoint(x: xPosition(forLane: lane), y: (size.height - indicatorTexture.size().height) / 2)
        indicator.zPosition = 1
        indicator.alpha = 0.9
        return indicator
    }

    private lazy var indicators: [SKSpriteNode] = {
        return Array(0..<self.numberOfLanes)
            .map { self.indicator(forLane: $0) }
    }()

    // MARK: - Actions

    private func pulseAction(for color: UIColor) -> SKAction {
        return .sequence([
            .colorize(with: color, colorBlendFactor: 1, duration: 0.1),
            .wait(forDuration: 0.7),
            .colorize(withColorBlendFactor: 0.0, duration: 0.2)
        ])
    }

    // MARK: - Helper Methods

    var size: CGSize {
        let numberOfLanes = (input as? Composable)?.numberOfLanes ?? 1
        return CGSize(width: conveyorWidth * CGFloat(numberOfLanes), height: conveyorWidth)
    }
}
