extension MachineSerializable {
    static func spawnerConfiguration(for items: [Int: ItemSerializable]) -> [PlaygroundValue] {
        let spawner = Spawner.configuration(forItems: items)
        let conveyor = Conveyor.configuration(length: 128)
        return [spawner, conveyor]
    }
}
