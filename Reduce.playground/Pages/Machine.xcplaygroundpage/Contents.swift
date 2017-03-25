import CoreGraphics
import Foundation
import PlaygroundSupport

let controller = MachineController(size: CGSize(width: 512, height: 768))
controller.addFloor()
controller.machine = Machine(parts: [
    Conveyor(length: 192, numberOfLanes: 5),
    Filter(numberOfLanes: 5, description: "!isScared") { $0.label.text != "😱" },
    Conveyor(numberOfLanes: 5),
    Filter(numberOfLanes: 5, description: "!isAngry") { $0.label.text != "😡" },
    Conveyor(numberOfLanes: 5),
    Map(numberOfLanes: 5, description: "box") { _ in Item(text: "📦") },
    Conveyor(numberOfLanes: 5),
    Reduce(numberOfLanes: 5, description: "pack") { _ in Item(text: "🚚") },
    Conveyor(),
    Destroyer()
])

let machine = Machine(numberOfLanes: 5, [
    [
        "type": "Spawner",
        "output": [
            ["title": "😃"],
            ["title": "😱"],
            ["title": "☺️"]
        ]
    ],
    [
        "type": "Conveyor",
        "length": 192
    ],
    [
        "type": "Filter",
        "description": "!isScared",
        "output": [
            ["title": "😃"],
            nil,
            ["title": "☺️"]
        ]
    ],
    [
        "type": "Conveyor"
    ],
    [
        "type": "Map",
        "description": "box",
        "output": [
            ["title": "📦"],
            nil,
            ["title": "📦"]
        ]
    ],
    [
        "type": "Conveyor"
    ],
    [
        "type": "Reduce",
        "description": "pack",
        "output": [
            ["title": "🚚"],
        ]
    ],
    [
        "type": "Conveyor"
    ],
    [
        "type": "Destroyer"
    ]
])

PlaygroundPage.current.liveView = controller

let emojis = ["😃", "😡", "😱", "☺️"]

Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
    for lane in 0..<5 {
        controller.machine?.add(Item(text: emojis.randomElement), toLane: lane)
    }
}

//: [Next](@next)
