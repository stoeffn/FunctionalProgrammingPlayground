extension Composable {
    func updateAppearance() { }

    func trigger() { }

    var items: [Item?] {
        let inputComponent = input as? Composable
        return inputComponent?.items ?? []
    }

    func process(_ items: [Item?]) { }
}
