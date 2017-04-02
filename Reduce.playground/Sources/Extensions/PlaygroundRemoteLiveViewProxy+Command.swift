import PlaygroundSupport

extension PlaygroundRemoteLiveViewProxy {
    /// Send a command to the live view.
    func send(command: Command) {
        send(command.rawValue)
    }
}
