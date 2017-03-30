/*:
 # Putting It All Together ⚒

 We've got our ingredients! But how do we actually combine them?
 
 Well, we do have a `combine` function. It takes a plate, which may already have food, as well as an ingredient and returns a plate with the food item added on top.
 
 * example:
 ```combine(🍽, 🥕)``` results in a plate with a carrot.
 
 However, combining all food items would—again—be quite tedious.
 
 # Reduction ➕

 There is another functional method that will help us: `reduce`!

 * callout(Reducing):
 `ingredients.reduce(initialResult: Result, nextPartialResult: (Result, Food) -> Result)`

 It may seem intimidating at first, but let's take a closure (get it?) look at this method, which will prove to be ueful in a variety of places.
 
 **Try to use the `reduce` and `combine` methods in a way that produces the desired salad.**
 */
//#-hidden-code
import PlaygroundSupport

let page = PlaygroundPage.current
let food = [🍎, 🍓, 🥒, 🥕, 🍃, 🍂]

resetMachine()
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, food, isVegetable, isApple, ingredients, item, filter, reduce)
//#-code-completion(keyword, show, let)
//#-editable-code
let salad = food
    .filter({ item in item.isVegetable })
    .reduce(🍽, { _, _ in 🍽 })

// TODO: Use code copying!
// TODO: Hints!
//#-end-editable-code
//#-hidden-code
triggerMachine()

if ingredients == [🥒, 🥕, 🍃] {
    page.assessmentStatus = .pass(
        message: "**Well done!** Our salas is ready to be served 🥗")
} else {
    page.assessmentStatus = .fail(hints: [

    ], solution: nil)
}
//#-end-hidden-code

