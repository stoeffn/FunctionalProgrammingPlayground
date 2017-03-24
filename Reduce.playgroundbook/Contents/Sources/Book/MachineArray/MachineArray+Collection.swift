extension MachineArray: Collection {
    public var startIndex: Int {
        return items.startIndex
    }

    public var endIndex: Int {
        return items.endIndex
    }

    public func index(after i: Int) -> Int {
        return items.index(after: i)
    }

    public func makeIterator() -> IndexingIterator<[Element]> {
        return items.makeIterator()
    }
}
