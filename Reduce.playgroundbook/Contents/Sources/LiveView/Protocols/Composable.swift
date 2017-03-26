import PlaygroundSupport

protocol Composable: Chainable {
    init(_ configuration: [String: PlaygroundValue])

    func updateAppearance()

    func trigger()

    var items: [Item?] { get }

    func process(_ items: [Item?])
}
