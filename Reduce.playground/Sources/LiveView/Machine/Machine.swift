import SpriteKit

public final class Machine: Component {
    public let node = SKNode()

    var output: Chainable?

    private(set) var components = [Component]()

    // MARK: - Life Cycle

    init(components: [Component]) {
        components.forEach(add)
    }

    public convenience init(numberOfLanes: Int? = 1, _ configuration: [String: PlaygroundValue]) {
        let componentConfigurations = configuration["components"]?
            .array?
            .flatMap { $0.dictionary }
        let types = componentConfigurations?
            .map { component(forType: $0["type"]?.string ?? "") }
        let components = zip(types ?? [], componentConfigurations ?? [])
            .flatMap { $0?.init(numberOfLanes: 1, $1) }
        self.init(components: components)
    }

    public convenience init(numberOfLanes: Int? = 1, _ components: [PlaygroundValue]) {
        self.init(numberOfLanes: numberOfLanes, ["components": .array(components)])
    }

    // MARK: - Component

    public func activate() {
        components.first?.activate()
    }

    // MARK: - Helper Methods

    private func add(_ component: Component) {
        component.attach(to: components.last?.outputAnchor ?? node.position)

        components.last?.output = component
        components.append(component)
        node.addChild(component.node)
    }
}
