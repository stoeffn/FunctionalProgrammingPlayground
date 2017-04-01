public typealias Speed = Int

extension Speed: ItemSerializable {
    public var title: String {
        return String(self) + "km/h"
    }
}
