import PlaygroundSupport
import SpriteKit

/// AN operation like `filter`, `map`, or `reduce`.
final class Operation: Composable {
    enum Method: String {
        case filter, map, reduce

        var casingTexture: SKTexture {
            switch self {
            case .filter: return filterCasingTexture
            case .map: return mapCasingTexture
            case .reduce: return reduceCasingTexture
            }
        }
    }

    let node: SKNode = SKCropNode()
    let method: Method
    let description: String

    private let removalConveyorLength: CGFloat = 768

    weak var input: Chainable?
    var output: Chainable?
    weak var itemContainer: SKNode?
    var items: [Int: Item]

    // MARK: - Life Cycle

    init?(method: Method?, items: [Int: Item]?, description: String? = nil) {
        guard let method = method else { return nil }
        self.method = method
        self.items = items ?? [:]
        self.description = description ?? ""
    }

    convenience init?(_ configuration: Configuration) {
        let method = Method(rawValue: configuration["type"]?.string?.lowercased() ?? "")
        let items = Item.multipleFrom(configuration: configuration["items"]?.dictionary)
        let description = configuration["description"]?.string
        self.init(method: method, items: items, description: description)
    }

    // MARK: - Chainable

    var size: CGSize {
        return CGSize(width: conveyorWidth * CGFloat(numberOfInputLanes), height: conveyorWidth)
    }

    // MARK: - Component

    var numberOfOutputLanes: Int {
        return method == .reduce ? 1 : numberOfInputLanes
    }

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

    /// Moves the items to its vertical center and then applies an action, which depends on the method chosen.
    func process(_ items: [Int: Item]) {
        items.forEach(processItem)

        let duration = movementDuration(forDistance: size.height)
        Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { _ in
            let outputComponent = self.output as? Composable
            outputComponent?.process(self.items)
            self.items.removeAll()
        }
    }

    private func processItem(inLane lane: Int, _ oldItem: Item?) {
        guard let oldItem = oldItem else { return }

        let duration = movementDuration(forDistance: size.height / 2)
        let movement = SKAction.move(by: CGVector(dx: 0, dy: -size.height / 2), duration: duration)
        let hasItemChanged = items[lane] ?? nil != oldItem
        let shouldAnimateRemoval = method == .filter && hasItemChanged

        if method == .filter {
            indicators[lane].run(pulseAction(for: hasItemChanged ? redIndicator : greenIndicator))
        }

        oldItem.node.run(movement) {
            guard let newItem = self.replacingItem(atLane: lane, oldItem, animated: shouldAnimateRemoval) else { return }
            newItem.node.run(movement)
        }
    }

    private func replacingItem(atLane lane: Int, _ oldItem: Item, animated: Bool) -> Item? {
        defer { removeItem(atLane: lane, oldItem, animated: animated) }
        guard let newItem = items[lane] ?? nil else { return nil }

        newItem.node.position = position(forItemAtLane: lane, replacingItem: oldItem, numberOfLanes: numberOfOutputLanes)
        itemContainer?.addChild(newItem.node)
        return newItem
    }

    private func removeItem(atLane lane: Int, _ item: Item, animated: Bool) {
        guard animated else {
            item.node.removeFromParent()
            return
        }

        let duration = movementDuration(forDistance: removalConveyorLength)
        let delay = SKAction.wait(forDuration: Double(numberOfInputLanes - lane) / 4)
        let movement = SKAction.move(by: CGVector(dx: removalConveyorLength, dy: 0), duration: duration)

        item.node.position = position(forItemAtLane: numberOfInputLanes - 1)
        item.node.run(.sequence([delay, movement])) {
            item.node.removeFromParent()
        }
    }

    // MARK: - Nodes

    private lazy var casingNode: SKSpriteNode = {
        let node = SKSpriteNode(texture: self.method.casingTexture)
        node.centerRect = CGRect(x: 0.4, y: 0, width: 0.2, height: 1)
        node.xScale = (self.size.width + 32) / self.method.casingTexture.size().width
        node.yScale = self.size.height / self.method.casingTexture.size().height
        node.zPosition = 2
        return node
    }()

    private lazy var labelNode: SKLabelNode = {
        let label = SKLabelNode(fontNamed: monoSpacedFontName)
        label.verticalAlignmentMode = .center
        label.color = .white
        label.fontSize = self.size.height / 4
        label.zPosition = 2
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
        indicator.zPosition = 2
        indicator.alpha = 0.9
        return indicator
    }

    private lazy var indicators: [SKSpriteNode] = {
        return Array(0..<self.numberOfInputLanes)
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
}
