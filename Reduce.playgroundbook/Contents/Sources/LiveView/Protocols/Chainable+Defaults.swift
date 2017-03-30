import CoreGraphics

extension Chainable {
    var size: CGSize {
        return .zero
    }

    var inputAnchor: CGPoint {
        return CGPoint(x: 0, y: size.height / 2)
    }

    var outputAnchor: CGPoint {
        return -CGPoint(x: 0, y: size.height / 2)
    }

    func attach(to chainable: Chainable) {
        node.position = chainable.position + chainable.outputAnchor - inputAnchor
    }
}
