public extension Dictionary {
    public init(_ pairs: [Element]) {
        self.init()
        pairs.forEach { self[$0] = $1 }
    }

    public func mapPairs<Key: Hashable, Value>(_ transform: (Element) throws -> (Key, Value)) rethrows -> [Key: Value] {
        return Dictionary<Key, Value>(try map(transform))
    }

    public func filterPairs(_ includeElement: (Element) throws -> Bool) rethrows -> [Key: Value] {
        return Dictionary(try filter(includeElement))
    }
}
