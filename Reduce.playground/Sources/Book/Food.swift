public typealias Food = String

public let 🍏: Food = "🍏"
public let 🍎: Food = "🍎"
public let 🍓: Food = "🍓"
public let 🥒: Food = "🥒"
public let 🥕: Food = "🥕"
public let 🍃: Food = "🍃"
public let 🍂: Food = "🍂"
public let 🥗: Food = "🥗"
public let 🥔: Food = "🥔"
public let 🌾: Food = "🌾"
public let 🐖: Food = "🐖"


extension Food: ItemSerializable {
    public var title: String {
        return self
    }

    /// Whether this food item is an apple or something else.
    public var isApple: Bool {
        return [🍏, 🍎].contains(self)
    }

    /// Whether this food item is a vegetable.
    public var isVegetable: Bool {
        return [🥒, 🥕, 🍃, 🍂].contains(self)
    }

    /// The number of days since this food item was bought. May be used for checking whether it is expired.
    public var age: Int {
        switch self {
        case 🍓, 🍃: return 1
        case 🍏, 🍎: return 2
        case 🥒, 🥕: return 4
        case 🍂: return 5
        default: return 7
        }
    }


    /// The processed version of this food item or itself if it cannot be processed.
    public var processed: Food {
        switch self {
        case 🥔: return "🍟"
        case 🐖: return "🥓"
        case 🌾: return "🍞"
        default: return self
        }
    }
}
