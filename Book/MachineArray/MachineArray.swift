public struct MachineArray<Element> {
    let items: [Element]
    let parts: [ChainableProxy]

    init(_ items: [Element] = [], parts: [ChainableProxy] = []) {
        self.items = items
        self.parts = parts
    }

    public subscript(position: Int) -> Element {
        return items[position]
    }

    public func filter(_ isIncluded: (Element) throws -> Bool) rethrows -> MachineArray<Element> {
        return try MachineArray(items.filter(isIncluded), parts: parts + [FilterProxy()])
    }
}
