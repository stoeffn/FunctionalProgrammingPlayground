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
let food = MachineArray(🍎, 🍓, 🥒, 🥕, 🍃, 🍂)
let ingredients = food
    .filter({ item in item.isVegetable })
//#-end-editable-code

//#-hidden-code
triggerMachine()
//#-end-hidden-code

//: [Next](@next)
