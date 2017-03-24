public typealias Ingredient = String
public let ingredients = MachineArray<Ingredient>()

public extension Ingredient {
    var age: Int {
        return 7
    }

    var isVegetable: Bool {
        return true
    }

    func combine(with ingredient: Ingredient) -> Ingredient {
        return "🥗"
    }
}
