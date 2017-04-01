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
let cars = [🚗, 🚕, 🚙, 🚌, 🚎, 🏎, 🚓]
//#-hidden-code
    .visualized
//#-end-hidden-code

//#-editable-code
//#-copy-source(code)
let electricCars = cars
    .filter { car in car.isElectric }

/*let maxElectricCarSpeed = cars
    .filter { $0.isElectric }
    .map { $0.maxSpeed }
    .reduce(0, max)*/
//#-end-editable-code

//#-hidden-code
triggerMachine()
//#-end-hidden-code

//: [Next](@next)
