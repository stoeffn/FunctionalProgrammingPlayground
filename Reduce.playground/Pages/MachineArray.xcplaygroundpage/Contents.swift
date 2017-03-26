//: [Previous](@previous)

import CoreGraphics
import PlaygroundSupport

let controller = MachineController(size: CGSize(width: 512, height: 768))
controller.addFloor()

public typealias Ingredient = String

extension Ingredient: ItemConvertible {
    public var title: String {
        return self
    }
}

let 🍏: Ingredient = "🍏"
let 🍎: Ingredient = "🍎"

let test = MachineArray(🍏, 🍎)
//    .filter { $0 == 🍎 }

controller.machine = Machine(test.configuration)
controller.machine?.trigger()

PlaygroundPage.current.liveView = controller

//: [Next](@next)
