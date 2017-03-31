/*:
 # Want a Burger? 🍔
 
 Let's make something almost everybody will like: A delicious Burger! (We are still watching our health, right?)
 
 Again, we have raw ingredients prepared. But how do we get from wheat, potato, and pig to bread, fries, and pork? There is a property that knows how to process each food item.
 
 * example:
 ```🥔.processed``` yields 🍟.
 
 Doing this on the whole list? Easy when…
 
 # Mastering Mapping 🗺
 
 The `map` method applies a transform to each item in a list, individually. This means we can call one method that cooks all our items?
 
 * callout(Mapping):
 `ingredients.map(transform: (Food) -> Any)`
 
 **Sounds cool? Let's try it out!**
 
 *We want in the end so be sure to combine the ingredients after cooking*
 */
//#-hidden-code
import PlaygroundSupport

let page = PlaygroundPage.current
machineProxy = page.liveView as! PlaygroundRemoteLiveViewProxy

let ingredients = MachineArray(🥔, 🌾, 🐖)
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, food, isVegetable, isApple, processed, ingredients, item, filter, reduce, map)
//#-code-completion(keyword, show, let)
//#-editable-code
let burger = ingredients
    .map({ item in item })
    .reduce(🍽, { _, _ in 🍽 })

// TODO: Hints
//#-end-editable-code
//#-hidden-code
triggerMachine()

if burger == "🍔" {
    page.assessmentStatus = .pass(
        message: "**Well done!** That tasted good 😋")
} else {
    page.assessmentStatus = .fail(hints: [

    ], solution: nil)
}
//#-end-hidden-code

 
