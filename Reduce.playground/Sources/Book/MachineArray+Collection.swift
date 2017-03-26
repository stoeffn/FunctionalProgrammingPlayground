extension MachineArray: Collection {
    public var startIndex: Int {
        return Array(items.values).startIndex
    }

    public var endIndex: Int {
        return Array(items.values).endIndex
    }

    public func index(after i: Int) -> Int {
        return Array(items.values).index(after: i)
    }

    public func makeIterator() -> IndexingIterator<[Element]> {
        return Array(items.values).makeIterator()
    }
}
