import Foundation

public extension Collection {
    /// Returns a dictionary with the array indexes as the keys.
    public var indexedDictionary: [Int: Iterator.Element] {
        var result: [Int: Iterator.Element] = [:]
        enumerated().forEach { result[$0.offset] = $0.element }
        return result
    }
}
