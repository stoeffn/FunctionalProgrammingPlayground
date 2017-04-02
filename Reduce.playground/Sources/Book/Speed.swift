/// The speed of somthing im miles per hour.
public typealias Speed = Int

extension Speed: ItemSerializable {
    public var title: String {
        return String(self) + "mph"
    }
}
