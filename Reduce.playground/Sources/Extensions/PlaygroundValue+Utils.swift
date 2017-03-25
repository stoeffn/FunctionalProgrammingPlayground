import Foundation
import CoreGraphics
import PlaygroundSupport

public extension PlaygroundValue {
    var string: String? {
        if case .string(let value) = self {
            return value
        }
        return nil
    }

    var integer: Int? {
        if case .integer(let value) = self {
            return value
        }
        return nil
    }

    var boolean: Bool? {
        if case .boolean(let value) = self {
            return value
        }
        return nil
    }

    var floatingPoint: Double? {
        if case .floatingPoint(let value) = self {
            return value
        }
        return nil
    }

    var cgFloat: CGFloat? {
        if case .floatingPoint(let value) = self {
            return CGFloat(value)
        }
        return nil
    }

    var date: Date? {
        if case .date(let value) = self {
            return value
        }
        return nil
    }

    var data: Data? {
        if case .data(let value) = self {
            return value
        }
        return nil
    }

    var array: [PlaygroundValue]? {
        if case .array(let value) = self {
            return value
        }
        return nil
    }

    var dictionary: [String: PlaygroundValue]? {
        if case .dictionary(let value) = self {
            return value
        }
        return nil
    }
}
