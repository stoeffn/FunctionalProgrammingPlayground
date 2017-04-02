import SpriteKit
import UIKit

/// Responsible for controlling the scene that visualizes array operations.
public final class MachineController: UIViewController {
    // MARK: - Life Cycle

    override public func viewDidLoad() {
        super.viewDidLoad()

        view = sceneView

        view.addSubview(placeholderView)
        placeholderView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        placeholderView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        machine?.attach(to: topAnchor)
    }

    // MARK: - User Interface

    private lazy var scene: SKScene = {
        let scene = SKScene(size: self.view.bounds.size)
        scene.backgroundColor = .clear
        scene.scaleMode = .resizeFill
        return scene
    }()

    private lazy var sceneView: SKView = {
        let view = SKView(frame: self.view.bounds)
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.allowsTransparency = true
        view.presentScene(self.scene)
        return view
    }()

    private lazy var placeholderTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .title1)
        label.text = "Nothing to Show"
        return label
    }()

    private lazy var placeholderSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .title3)
        label.textColor = .darkGray
        label.text = "Run your code and watch the animation—it will automatically adapt to your code!"
        return label
    }()

    private lazy var placeholderView: UIVisualEffectView = {
        let view = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: UIBlurEffect(style: .light)))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 386).isActive = true

        view.contentView.addSubview(self.placeholderTitle)
        self.placeholderTitle.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.placeholderTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.placeholderTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        view.contentView.addSubview(self.placeholderSubtitle)
        self.placeholderSubtitle.topAnchor.constraint(equalTo: self.placeholderTitle.bottomAnchor, constant: 8).isActive = true
        self.placeholderSubtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.placeholderSubtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.placeholderSubtitle.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64).isActive = true

        return view
    }()

    // MARK: - Floor

    private lazy var floor = Floor(size: UIScreen.main.bounds.size)

    public func addFloor() {
        scene.addChild(floor.node)
    }

    public func removeFloor() {
        floor.node.removeFromParent()
    }

    // MARK: - Machine

    /// The machine currently presented by the controller. Setting it to `nil` will remove the current machine and show
    /// a placeholder insteat. Adding a machine will attach it to the top and display it automatically.
    public var machine: Machine? {
        didSet {
            placeholderView.isHidden = machine != nil
            oldValue?.node.removeFromParent()

            if let machine = machine {
                machine.attach(to: topAnchor)
                scene.addChild(machine.node)
            }
        }
    }

    // MARK: - Helpers

    /// A horizontally centered point slightly above the view because items should spawn off-screen.
    private var topAnchor: CGPoint {
        return CGPoint(x: view.bounds.size.width / 2, y: view.bounds.height + conveyorWidth / 2)
    }
}
