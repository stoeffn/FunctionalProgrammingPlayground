import UIKit

public extension UIViewController {
    /// Creates a new view controller in a window with a specific size. Useful for setting the size in an Xcode
    /// playground.
    public convenience init(size: CGSize) {
        self.init(nibName: nil, bundle: nil)

        let frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        let window = UIWindow(frame: frame)
        window.rootViewController = self

        preferredContentSize = size
        view.frame = frame
    }
}
