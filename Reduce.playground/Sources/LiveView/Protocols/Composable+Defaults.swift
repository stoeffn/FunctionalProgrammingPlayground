extension Composable {
    func updateAppearance() { }

    func trigger() { }

    var items: [Int: Item] {
        return (input as? Composable)?.items ?? [:]
    }

    func process(_ items: [Int: Item]) { }
}
