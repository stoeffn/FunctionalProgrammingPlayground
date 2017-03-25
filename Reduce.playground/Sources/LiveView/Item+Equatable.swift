extension Item: Equatable {
    public static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.label.text == rhs.label.text
    }
}
