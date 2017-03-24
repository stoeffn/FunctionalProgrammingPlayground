import PlaygroundSupport

extension MachineController: PlaygroundRemoteLiveViewProxyDelegate {
    func receive(_ message: PlaygroundValue) {
        print(message)
        machine?.add(Item(text: message.description), toLane: 0)
    }
}
