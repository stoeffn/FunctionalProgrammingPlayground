import PlaygroundSupport
import SpriteKit

let controller = MachineController()
controller.machine = Machine(parts: [
    Conveyor(length: 192, numberOfLanes: 5),
    Filter(numberOfLanes: 5, description: "!isScared") { $0.label.text != "😱" },
    Conveyor(numberOfLanes: 5),
    Filter(numberOfLanes: 5, description: "!isAngry") { $0.label.text != "😡" },
    Conveyor(numberOfLanes: 5),
    Map(numberOfLanes: 5, description: "box") { _ in Item(text: "📦") },
    Conveyor(numberOfLanes: 5),
    Reduce(numberOfLanes: 5, description: "combine") { _ in Item(text: "🚚") },
    Conveyor(),
    Destroyer()
])

PlaygroundPage.current.liveView = controller
