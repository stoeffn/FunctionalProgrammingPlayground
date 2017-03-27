import PlaygroundSupport

protocol Composable: Chainable {
    init?(_ configuration: [String: PlaygroundValue])

    func updateAppearance()

    func trigger()

    var numberOfInputLanes: Int { get }

    var numberOfOutputLanes: Int { get }

    var items: [Int: Item] { get }

    func process(_ items: [Int: Item])
}
