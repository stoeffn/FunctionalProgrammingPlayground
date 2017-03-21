import CoreGraphics
import Foundation

let controller = MachineController(size: CGSize(width: 512, height: 768))
controller.setAsLiveView()
controller.addFloor()
controller.machine = Machine(parts: [
    Conveyor(length: 256, numberOfLanes: 5),
    Filter(numberOfLanes: 5, description: "!isScared") { $0.label.text != "😱" },
    Conveyor(length: 128, numberOfLanes: 5),
    Filter(numberOfLanes: 5, description: "!isAngry") { $0.label.text != "😡" },
    Conveyor(length: 128, numberOfLanes: 5),
    Destroyer()
])

let emojis = ["😃", "😡", "😱", "☺️"]

Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
    for lane in 0..<5 {
        controller.machine?.add(Item(text: emojis.randomElement), toLane: lane)
    }
}
