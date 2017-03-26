extension PlaygroundValue: CustomStringConvertible {
    public var description: String {
        switch self {
        case .string(let value): return value.description
        case .integer(let value): return value.description
        case .boolean(let value): return value.description
        case .floatingPoint(let value): return value.description
        case .date(let value): return value.description
        case .data(let value): return value.description
        case .array(let value): return value.description
        case .dictionary(let value): return value.description
        }
    }
}
