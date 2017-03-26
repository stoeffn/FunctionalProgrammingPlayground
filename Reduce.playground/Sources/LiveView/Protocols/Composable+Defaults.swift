extension Composable {
    func updateAppearance() { }

    func trigger() { }

    var numberOfInputLanes: Int {
        let previousComponent = input as? Composable
        return previousComponent?.numberOfOutputLanes ?? 0
    }

    var numberOfOutputLanes: Int {
        return numberOfInputLanes
    }

    var items: [Int: Item] {
        let previousComponent = input as? Composable
        return previousComponent?.items ?? [:]
    }

    func process(_ items: [Int: Item]) { }
}
