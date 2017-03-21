import PlaygroundSupport
import UIKit

public extension UIViewController {
    public convenience init(size: CGSize) {
        self.init(nibName: nil, bundle: nil)

        let frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        let window = UIWindow(frame: frame)
        window.rootViewController = self

        preferredContentSize = size
        view.frame = frame
    }

    public func setAsLiveView() {
        PlaygroundPage.current.liveView = view
    }
}
