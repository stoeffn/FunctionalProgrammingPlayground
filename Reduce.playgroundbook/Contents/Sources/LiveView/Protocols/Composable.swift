import PlaygroundSupport
import SpriteKit

/// The base protocol for components that can process items.
protocol Composable: Chainable {
    /// Creates a new instance given a configuration dictionary.
    init?(_ configuration: Configuration)

    /// Updates the component's layout and appearance. This is not part of the constructor as some caclculations may
    /// need the input component to be set.
    ///
    /// - Note: May not work a second time for certain components.
    func updateAppearance()

    /// Triggers the component in a way that makes sense for it, e.g. a spawner creates new items. Defaults to be empty.
    func trigger()

    /// The number of lanes the component takes as input. Defaults to the previous component's number of output lanes.
    var numberOfInputLanes: Int { get }

    /// The number of lanes the component gives as output. Defaults to the number of input lanes.
    var numberOfOutputLanes: Int { get }

    /// The global container node that contains all items.
    weak var itemContainer: SKNode? { get set }

    /// May be used to store items that get added when triggered or processing. Defaults to be the previous component's
    /// items.
    var items: [Int: Item] { get }

    /// Processes the items given in a way that makes sense for the component. For example, a conveyor moves the items
    /// and then passes the to the next component.
    func process(_ items: [Int: Item])
}
