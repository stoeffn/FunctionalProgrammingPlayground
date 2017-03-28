import PlaygroundSupport

public struct PlaygroundRemoteLiveViewProxy {
    public init() { }

    public func send(_ value: PlaygroundValue) {
        let handler = PlaygroundPage.current.liveView as? PlaygroundLiveViewMessageHandler
        handler?.receive(value)
    }
}
