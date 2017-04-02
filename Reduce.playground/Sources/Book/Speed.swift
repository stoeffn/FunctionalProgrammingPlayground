/// The speed of somthing im km/h.
public typealias Speed = Int

extension Speed: ItemSerializable {
    public var title: String {
        return String(self) + "km/h"
    }
}
