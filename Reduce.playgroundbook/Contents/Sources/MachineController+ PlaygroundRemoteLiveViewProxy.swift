import PlaygroundSupport

extension MachineController: PlaygroundLiveViewMessageHandler {
    public func receive(_ message: PlaygroundValue) {
        if case .string(let value) = message {
            machine?.add(Item(text: value), toLane: 0)
        }
    }
}
