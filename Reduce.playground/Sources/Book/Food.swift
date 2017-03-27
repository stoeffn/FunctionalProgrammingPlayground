public typealias Food = String

public let 🍏: Food = "🍏"
public let 🍎: Food = "🍎"
public let 🍐: Food = "🍐"
public let 🥒: Food = "🥒"
public let 🥕: Food = "🥕"
public let 🍽: Food = "🍽"
public let 🥗: Food = "🥗"
public let 💩: Food = "💩"
public let 🚽: Food = "🚽"

extension Food: ItemConvertible {
    public var title: String {
        return self
    }

    public var isApple: Bool {
        return [🍏, 🍎].contains(self)
    }

    public var isVegetable: Bool {
        return [🥒, 🥕].contains(self)
    }
}

public func eat(_ food: Food) -> Food {
    return 💩
}
