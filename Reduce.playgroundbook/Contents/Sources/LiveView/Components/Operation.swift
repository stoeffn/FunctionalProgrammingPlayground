import PlaygroundSupport
import SpriteKit

final class Operation: Composable {
    enum Method: String {
        case none, filter, map, reduce
    }

    let node: SKNode = SKCropNode()
    let method: Method
    let description: String

    weak var input: Chainable?
    var output: Chainable?
    var items: [Item?]
    var indicators = [SKSpriteNode]()

    // MARK: - Life Cycle

    init(method: Method?, items: [Item?]?, description: String? = nil) {
        self.method = method ?? .none
        self.items = items ?? []
        self.description = description ?? ""
    }

    convenience init(_ configuration: [String: PlaygroundValue]) {
        let method = Method(rawValue: configuration["type"]?.string?.lowercased() ?? "")
        let items = configuration["items"]?
            .array?
            .flatMap { $0.dictionary }
            .map { Item($0) }
        let description = configuration["description"]?.string
        self.init(method: method, items: items, description: description)
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
        node.addChild(exclusionConveyor.node)
        node.addChild(labelNode)

        if method == .filter {
            addIndicators()
        }
    }

    func process(_ items: [Item?]) {
        items
            .enumerated()
            .forEach(processItem)
    }

    private func processItem(inLane lane: Int, _ oldItem: Item?) {
        guard let oldItem = oldItem else { return }

        let duration = movementDuration(forDistance: size.height)
        let movement = SKAction.move(by: CGVector(dx: 0, dy: -size.height / 2), duration: duration / 2)
        let isItemUnchanged = items[safe: lane] ?? nil == oldItem

        if method == .filter {
            indicators[lane].run(pulseAction(for: isItemUnchanged ? greenIndicator : redIndicator))
        }

        oldItem.node.run(movement) {
            guard let newItem = self.replacingItem(atLane: lane, oldItem) else { return }
            newItem.node.run(movement)
        }

        Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { _ in
            (self.output as? Composable)?.process(self.items)
            self.items.removeAll()
        }
    }

    private func replacingItem(atLane lane: Int, _ oldItem: Item) -> Item? {
        defer { oldItem.node.removeFromParent() }
        guard let newItem = items[safe: lane] ?? nil else { return nil }

        newItem.node.position = absolutePosition(forItemAtLane: lane, replacingItem: oldItem)
        oldItem.node.scene?.addChild(newItem.node)
        return newItem
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

    private lazy var exclusionConveyor: Conveyor = {
        let conveyor = Conveyor(length: 256)
        conveyor.node.position = CGPoint(x: self.size.width / 2 + 128, y: 0)
        conveyor.node.zRotation = .pi / 2
        return conveyor
    }()

    private func indicator(forLane lane: Int) -> SKSpriteNode {
        let indicator = SKSpriteNode(texture: indicatorTexture)
        indicator.position = CGPoint(x: xPosition(forLane: lane), y: (size.height - indicatorTexture.size().height) / 2)
        indicator.zPosition = 1
        indicator.alpha = 0.9
        return indicator
    }

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
        return CGSize(width: conveyorWidth * CGFloat(numberOfInputLanes), height: conveyorWidth)
    }

    private func addIndicators() {
        for lane in 0..<numberOfLanes {
            let indicator = self.indicator(forLane: lane)
            indicators.append(indicator)
            node.addChild(indicator)
        }
    }
}
