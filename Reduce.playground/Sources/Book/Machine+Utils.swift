extension Machine {
    public static func addBin() {
        guard let proxy = machineProxy else {
            fatalError("Proxy not available.")
        }
        proxy.send(command: .addComponent(bin))
    }

    public static func trigger() {
        guard let proxy = machineProxy else {
            fatalError("Proxy not available.")
        }
        proxy.send(command: .trigger)
    }
}
