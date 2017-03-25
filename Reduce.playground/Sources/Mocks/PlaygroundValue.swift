import Foundation

public enum PlaygroundValue {
    case string(String)
    case integer(Int)
    case boolean(Bool)
    case floatingPoint(Double)
    case date(Date)
    case data(Data)
    case array([PlaygroundValue])
    case dictionary([String: PlaygroundValue])
}
