import CoreGraphics
import Foundation
import PlaygroundSupport

let controller = MachineController(size: CGSize(width: 512, height: 768))
controller.addFloor()
controller.machine = Machine([
    .dictionary([
        "type": .string("Spawner"),
        "items": .array([
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
        "items": .array([
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
        "items": .array([
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
        "items": .array([
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
controller.machine?.trigger()

PlaygroundPage.current.liveView = controller
