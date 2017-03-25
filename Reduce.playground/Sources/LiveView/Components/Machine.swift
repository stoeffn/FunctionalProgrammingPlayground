import SpriteKit

public final class Machine: Composable {
    public let node = SKNode()

    weak var input: Chainable?
    var output: Chainable? {
        get { return lastComponent?.output }
        set { lastComponent?.output = newValue }
    }

    var firstComponent: Composable?
    weak var lastComponent: Composable?

    // MARK: - Life Cycle

    init(components: [Composable]) {
        firstComponent = components.first
        lastComponent = components.reduce(self, addComponent)
    }

    convenience init(_ configuration: [String: PlaygroundValue]) {
        let componentConfigurations = configuration["components"]?
            .array?
            .flatMap { $0.dictionary }
        let types = componentConfigurations?
            .map { component(forType: $0["type"]?.string ?? "") }
        let components = zip(types ?? [], componentConfigurations ?? [])
            .flatMap { $0?.init($1) }
        self.init(components: components)
    }

    public convenience init(_ components: [PlaygroundValue]) {
        self.init(["components": .array(components)])
    }

    // MARK: - Chainable

    var numberOfLanes: Int {
        return firstComponent?.numberOfLanes ?? 1
    }

    var outputAnchor: CGPoint {
        return lastComponent?.outputAnchor ?? .zero
    }

    func attach(to anchor: CGPoint) {
        node.position = anchor - inputAnchor
    }

    // MARK: - Component

    public func trigger() {
        firstComponent?.trigger()
    }

    // MARK: - Helpers

    private func addComponent(toPrevious previousComponent: Composable, _ component: Composable) -> Composable {
        previousComponent.output = component

        component.input = previousComponent
        component.attach(to: previousComponent)
        component.updateAppearance()
        node.addChild(component.node)

        return component
    }
}