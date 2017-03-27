//: [Previous](@previous)

//#-hidden-code
import CoreGraphics
import PlaygroundSupport

let controller = MachineController(size: CGSize(width: 512, height: 768))
controller.addFloor()
//#-end-hidden-code

//#-editable-code Do your magic!
let result = MachineArray(🍏, 🍐, 🍎)
    .filter { $0.isApple }
    .map(eat)
    .reduce(🚽, +)
//#-end-editable-code

//#-hidden-code
controller.machine = Machine(result)
controller.machine?.trigger()

PlaygroundPage.current.liveView = controller
//#-end-hidden-code

//: [Next](@next)
