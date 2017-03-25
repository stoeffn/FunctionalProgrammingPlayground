import PlaygroundSupport

extension MachineController: PlaygroundLiveViewMessageHandler {
    public func receive(_ message: PlaygroundValue) {
        print(message)
        if case .string(let value) = message {
            machine?.add(Item(text: value), toLane: 0)
        }
    }
}
