import CoreGraphics

extension Chainable {
    var inputAnchor: CGPoint {
        return .zero
    }

    var outputAnchor: CGPoint {
        return .zero
    }

    func attach(to chainable: Chainable) {
        node.position = chainable.node.position + chainable.outputAnchor - inputAnchor
    }
}
