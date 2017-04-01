public extension Array where Element: ItemSerializable, Element: Equatable {
    public var visualized: MachineArray<Element> {
        return MachineArray(self)
    }
}
