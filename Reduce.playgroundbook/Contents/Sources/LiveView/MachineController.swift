import SpriteKit
import UIKit

public final class MachineController: UIViewController {
    // MARK: - Life Cycle

    override public func viewDidLoad() {
        super.viewDidLoad()
        view = sceneView
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

    // MARK: - Floor

    private lazy var floor = Floor(size: UIScreen.main.bounds.size)

    public func addFloor() {
        scene.addChild(floor.node)
    }

    public func removeFloor() {
        floor.node.removeFromParent()
    }

    // MARK: - Machine

    public var machine: Machine? {
        didSet {
            oldValue?.node.removeFromParent()

            if let machine = machine {
                machine.attach(to: topAnchor)
                scene.addChild(machine.node)
            }
        }
    }

    // MARK: - Helpers

    private var topAnchor: CGPoint {
        return CGPoint(x: view.bounds.size.width / 2, y: view.bounds.height + conveyorWidth / 2)
    }
}
