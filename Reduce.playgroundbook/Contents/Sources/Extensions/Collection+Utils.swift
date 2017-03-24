import Foundation

public extension Collection where IndexDistance == Int, Index == Int {
    public var randomElement: Iterator.Element {
        let index = Int(arc4random_uniform(UInt32(count)))
        return self[index]
    }
}
