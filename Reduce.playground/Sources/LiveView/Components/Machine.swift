import PlaygroundSupport
import SpriteKit

/// Machine the houses multiple components and is a component itself.
public final class Machine: Composable {
    public let node = SKNode()

    weak var input: Chainable?
    var output: Chainable? {
        get { return lastComponent?.output }
        set { lastComponent?.output = newValue }
    }
    weak var itemContainer: SKNode?

    var firstComponent: Composable?
    weak var lastComponent: Composable?

    // MARK: - Life Cycle

    init(components: [Composable]? = nil) {
        firstComponent = components?.first
        lastComponent = components?.reduce(self, addComponent)
    }

    convenience init(_ configuration: [String: PlaygroundValue]) {
        let componentConfigurations = configuration["components"]?
            .array?
            .flatMap { $0.dictionary }
        let types = componentConfigurations?
            .map { componentType(for: $0["type"]?.string) }
        let components = zip(types ?? [], componentConfigurations ?? [])
            .flatMap { $0?.init($1) }
        self.init(components: components)
    }

    public convenience init(_ components: [PlaygroundValue]) {
        self.init(["components": .array(components)])
    }

    // MARK: - Chainable

    var position: CGPoint {
        return .zero
    }

    var outputAnchor: CGPoint {
        return lastComponent?.outputAnchor ?? .zero
    }

    func attach(to anchor: CGPoint) {
        node.position = anchor
    }

    // MARK: - Component

    var numberOfInputLanes: Int {
        return firstComponent?.numberOfInputLanes ?? 0
    }

    var numberOfOutputLanes: Int {
        return lastComponent?.numberOfInputLanes ?? 0
    }

    public func trigger() {
        firstComponent?.trigger()
    }

    func process(_ items: [Int : Item]) {
        firstComponent?.process(items)
    }

    // MARK: - Helpers

    private func addComponent(toPrevious previousComponent: Composable, _ component: Composable) -> Composable {
        previousComponent.output = component

        component.input = previousComponent
        component.itemContainer = itemContainer
        component.attach(to: previousComponent)
        component.updateAppearance()

        node.addChild(component.node)

        return component
    }

    func addComponent(byConfiguration configuration: Configuration) {
        guard let type = componentType(for: configuration["type"]?.string),
            let component = type.init(configuration) else { return }

        if firstComponent == nil {
            firstComponent = component
        }
        lastComponent = addComponent(toPrevious: lastComponent ?? self, component)
    }
}
