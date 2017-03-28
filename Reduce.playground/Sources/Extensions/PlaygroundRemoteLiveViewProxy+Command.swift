import PlaygroundSupport

extension PlaygroundRemoteLiveViewProxy {
    func send(command: Command) {
        send(command.rawValue)
    }
}
