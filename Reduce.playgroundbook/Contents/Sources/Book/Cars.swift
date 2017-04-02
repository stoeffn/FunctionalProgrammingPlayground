/// Represents any type of car, which may have an electric engine and has a maximum speed.
public struct Car {
    /// An emoji representation of this car.
    public var emoji: String

    /// Whether the car has an electric engine.
    public let isElectric: Bool

    /// The maximum speed in kilometers per hour.
    public let maxSpeed: Speed
}

extension Car: ItemSerializable {
    public var title: String {
        return emoji
    }
}

extension Car: Equatable {
    public static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.emoji == rhs.emoji
            && lhs.isElectric == rhs.isElectric
            && lhs.maxSpeed == rhs.maxSpeed
    }
}

public let 🚗 = Car(emoji: "🚗", isElectric: true, maxSpeed: 225)
public let 🚕 = Car(emoji: "🚕", isElectric: false, maxSpeed: 200)
public let 🚙 = Car(emoji: "🚙", isElectric: true, maxSpeed: 210)
public let 🏎 = Car(emoji: "🏎", isElectric: false, maxSpeed: 340)
public let 🚌 = Car(emoji: "🚌", isElectric: false, maxSpeed: 160)
public let 🚎 = Car(emoji: "🚎", isElectric: true, maxSpeed: 120)
