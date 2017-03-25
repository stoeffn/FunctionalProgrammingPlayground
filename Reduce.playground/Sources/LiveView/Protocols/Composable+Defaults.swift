extension Composable {
    func updateAppearance() { }

    func trigger() { }

    var items: [Item?] {
        return (input as? Composable)?.items ?? []
    }

    func process(_ items: [Item?]) { }
}
