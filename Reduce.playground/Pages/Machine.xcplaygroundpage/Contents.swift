import CoreGraphics
import Foundation
import PlaygroundSupport

let controller = MachineController(size: CGSize(width: 512, height: 768))
controller.addFloor()
controller.machine = Machine(numberOfLanes: 3, [
    .dictionary([
        "type": .string("Spawner"),
        "results": .array([
            .dictionary(["title": .string("😃")]),
            .dictionary(["title": .string("😱")]),
            .dictionary(["title": .string("☺️")])
        ])
    ]),
    .dictionary([
        "type": .string("Conveyor"),
        "length": .floatingPoint(192)
    ]),
    .dictionary([
        "type": .string("Filter"),
        "description": .string("!isScared"),
        "results": .array([
            .dictionary(["title": .string("😃")]),
            .dictionary([:]),
            .dictionary(["title": .string("☺️")])
        ])
    ]),
    .dictionary([
        "type": .string("Conveyor")
    ]),
    .dictionary([
        "type": .string("Map"),
        "description": .string("box"),
        "results": .array([
            .dictionary(["title": .string("📦")]),
            .dictionary([:]),
            .dictionary(["title": .string("📦")])
        ])
    ]),
    .dictionary([
        "type": .string("Conveyor")
    ]),
    .dictionary([
        "type": .string("Reduce"),
        "description": .string("pack"),
        "results": .array([
            .dictionary(["title": .string("🚚")])
        ])
    ]),
    .dictionary([
        "type": .string("Conveyor")
    ]),
    .dictionary([
        "type": .string("Destroyer")
    ])
])
controller.machine?.activate()

PlaygroundPage.current.liveView = controller

//: [Next](@next)
