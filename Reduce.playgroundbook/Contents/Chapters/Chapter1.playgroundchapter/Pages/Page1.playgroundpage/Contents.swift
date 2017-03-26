import PlaygroundSupport

let page = PlaygroundPage.current
let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy

let configuration: [PlaygroundValue] = [
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
        "length": .floatingPoint(128)
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
]

proxy.send(.array(configuration))
