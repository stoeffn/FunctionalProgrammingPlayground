import Foundation

public extension Collection {
    public var indexedDictionary: [Int: Iterator.Element] {
        var result: [Int: Iterator.Element] = [:]
        enumerated().forEach { result[$0.offset] = $0.element }
        return result
    }
}

public extension Collection where Indices.Iterator.Element == Index {
    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    public subscript (safe index: Index) -> Generator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

public extension Collection where IndexDistance == Int, Index == Int {
    public var randomElement: Iterator.Element {
        let index = Int(arc4random_uniform(UInt32(count)))
        return self[index]
    }
}
