import PlaygroundSupport

extension MachineController: PlaygroundLiveViewMessageHandler {
    public func receive(_ message: PlaygroundValue) {
        if case .array(let configuration) = message {
            machine = Machine(configuration)
            machine?.trigger()
        }
    }
}
