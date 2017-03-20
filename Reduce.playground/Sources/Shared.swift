import SpriteKit

public let redIndicator = UIColor(red: 0.988, green: 0.102, blue: 0.11, alpha: 1)
public let greenIndicator = UIColor(red: 0.325, green: 0.843, blue: 0.412, alpha: 1)

public let conveyerWidth: CGFloat = 64

func movementDuration(forDistance distance: CGFloat) -> TimeInterval {
    return abs(Double(distance) / 72)
}
