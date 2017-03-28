//: [Previous](@previous)

//#-hidden-code
import CoreGraphics
import PlaygroundSupport

let controller = MachineController(size: CGSize(width: 512, height: 768))
controller.addFloor()

PlaygroundPage.current.liveView = controller

machineProxy = PlaygroundRemoteLiveViewProxy()

//#-end-hidden-code

//#-editable-code Do your magic!
let result = MachineArray(🍏, 🍐, 🍎)
    .filter { $0.isApple }
    .map(eat)
    .reduce(🚽, +)
//#-end-editable-code

//#-hidden-code
//machineProxy?.send(command: .addComponent(destroyer))
controller.machine?.trigger()
//#-end-hidden-code

//: [Next](@next)
