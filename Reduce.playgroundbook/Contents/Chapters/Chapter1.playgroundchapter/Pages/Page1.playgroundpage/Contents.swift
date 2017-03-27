import PlaygroundSupport

let page = PlaygroundPage.current
let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy

let configuration: [PlaygroundValue] = [
    .dictionary([
        "type": .string("Spawner"),
        "items": .dictionary([
            "0": .dictionary(["title": .string("😃")]),
            "1": .dictionary(["title": .string("😱")]),
            "2": .dictionary(["title": .string("☺️")]),
            "3": .dictionary(["title": .string("😱")])
        ])
    ]),
    .dictionary([
        "type": .string("Conveyor"),
        "length": .floatingPoint(192)
    ]),
    .dictionary([
        "type": .string("Filter"),
        "description": .string("!isScared"),
        "items": .dictionary([
            "0": .dictionary(["title": .string("😃")]),
            "2": .dictionary(["title": .string("☺️")])
        ])
    ]),
    .dictionary([
        "type": .string("Conveyor")
    ]),
    .dictionary([
        "type": .string("Map"),
        "description": .string("box"),
        "items": .dictionary([
            "0": .dictionary(["title": .string("📦")]),
            "2": .dictionary(["title": .string("📦")])
        ])
    ]),
    .dictionary([
        "type": .string("Conveyor")
    ]),
    .dictionary([
        "type": .string("Reduce"),
        "description": .string("pack"),
        "items": .dictionary([
            "0": .dictionary(["title": .string("🚚")])
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
