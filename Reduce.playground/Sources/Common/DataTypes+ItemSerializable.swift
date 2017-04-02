extension Bool: ItemSerializable {
    public var title: String {
        return self ? "true" : "false"
    }
}

extension Double: ItemSerializable {
    public var title: String {
        return String(self)
    }
}

extension String: ItemSerializable {
    public var title: String {
        return self
    }
}
