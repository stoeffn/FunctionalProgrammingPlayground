import PlaygroundSupport

extension MachineController: PlaygroundLiveViewMessageHandler {
    public func receive(_ message: PlaygroundValue) {
        guard let command = Command(rawValue: message) else { return }

        switch command {
        case .reset:
            machine = Machine()
        case .addComponent(let configuration):
            machine?.addComponent(byConfiguration: configuration)
        case .trigger:
            machine?.trigger()
        }
    }
}
