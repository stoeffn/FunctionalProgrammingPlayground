import SpriteKit
import PlaygroundSupport

let frame = CGRect(x: 0, y: 0, width: 512, height: 768)

let scene = SKScene(size: frame.size)
scene.backgroundColor = .white
scene.scaleMode = .resizeFill

let view = SKView(frame: frame)
view.showsFPS = true
view.presentScene(scene)

let floor = Floor(size: frame.size)
scene.addChild(floor.node)

let anchor = CGPoint(x: frame.size.width / 2, y: frame.size.height + Constants.conveyerWidth)
let machine = Machine(anchor: anchor, parts: [
    Conveyor(length: 512, numberOfLanes: 5),
    Destroyer()
])
scene.addChild(machine.node)

PlaygroundPage.current.liveView = view

Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
    for lane in 0..<5 {
        let emoji = arc4random_uniform(2) == 0 ? "😃" : "😡"
        machine.add(Item(text: emoji), toLane: lane)
    }
}
