public extension Array where Element: ItemSerializable, Element: Equatable {
    /// Returns a new machine array using this array's elements.
    public var visualized: MachineArray<Element> {
        return MachineArray(self)
    }
}
