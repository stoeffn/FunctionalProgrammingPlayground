extension Machine {
    /// Adds a bin to the current machine that "holds" items.
    public static func addBin() {
        guard let proxy = machineProxy else {
            fatalError("Proxy not available.")
        }
        proxy.send(command: .addComponent(bin))
    }

    /// Triggers the current machine, i.e. tells the spawner to emit the items.
    public static func trigger() {
        guard let proxy = machineProxy else {
            fatalError("Proxy not available.")
        }
        proxy.send(command: .trigger)
    }
}
