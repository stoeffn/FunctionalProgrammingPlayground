import PlaygroundSupport

/// Protocol that that enables conected components to exchange information or trigger one another.
protocol Composable: Chainable {
    /// Creates a new component instance using the configuration given.
    ///
    /// - note: The component's nodes might not be fully initialized at this point. Call `updateAppearance()` in order
    ///         to display it.
    init?(_ configuration: Configuration)

    /// Updates the component's appearance according to its current state.
    ///
    /// This ist not part of the constructor because the appearance may depend on previous components, which are not set
    /// at the time of initilization.
    ///
    /// The default implementation does nothing.
    func updateAppearance()

    /// Triggers the component in a certain way. For example, a spawner might create its items when triggered.
    ///
    /// The default implementation does nothing.
    func trigger()

    /// Number of lanes the component takes as input.
    ///
    /// Defaults to the previous component's number of output lanes.
    var numberOfInputLanes: Int { get }

    /// Number of lanes the components produces as output.
    ///
    /// Defaults to the number of input lanes.
    var numberOfOutputLanes: Int { get }

    /// The items that this component will produce.
    ///
    /// Defaults to the previous component's items.
    var items: [Int: Item] { get }

    /// Processes the items given in a specific way. They may be moved, modified, replaced, …
    ///
    /// The default implementation does nothing.
    ///
    /// - note: In most cases, you will want to call the output's `processItems(:)` method after the items where
    ///         processed.
    func process(_ items: [Int: Item])
}
