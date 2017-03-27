import PlaygroundSupport

extension MachineController: PlaygroundLiveViewMessageHandler {
    public func receive(_ message: PlaygroundValue) {
        if case .array(let configuration) = message {
            machine = Machine(configuration + [Destroyer.configuration])
            machine?.trigger()
        }
    }
}
