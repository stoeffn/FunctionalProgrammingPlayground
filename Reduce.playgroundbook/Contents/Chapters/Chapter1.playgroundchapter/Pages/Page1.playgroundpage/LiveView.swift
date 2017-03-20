import SpriteKit
import PlaygroundSupport

let frame = CGRect(x: 0, y: 0, width: 512, height: 768)

let scene = SKScene(size: frame.size)
scene.backgroundColor = .clear
scene.scaleMode = .resizeFill

let view = SKView(frame: frame)
view.showsFPS = true
view.allowsTransparency = true
view.presentScene(scene)

let anchor = CGPoint(x: frame.size.width / 2, y: frame.size.height + conveyerWidth)
let machine = Machine(anchor: anchor, parts: [
    Conveyor(length: 256, numberOfLanes: 5),
    Filter(numberOfLanes: 5),
    Conveyor(length: 64, numberOfLanes: 5),
    Filter(numberOfLanes: 5),
    Conveyor(length: 128, numberOfLanes: 5),
    Destroyer()
])
scene.addChild(machine.node)

PlaygroundPage.current.liveView = view

Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
    for lane in 0..<5 {
        let emoji = arc4random_uniform(2) == 0 ? "😃" : "😡"
        machine.add(Item(text: emoji), toLane: lane)
    }
}
