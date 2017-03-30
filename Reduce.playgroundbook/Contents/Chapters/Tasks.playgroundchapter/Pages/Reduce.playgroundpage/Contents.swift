/*:
 # Putting It All Together ⚒

 We've got our ingredients! But how do we actually combine them?
 
 Well, we do have a `combine` function. It takes a plate as well as an ingredient and returns a plate with the food item added on top.
 
 * example:
 ```combine(🍽, 🥕)``` results in a plate with a carrot.
 
 However, combining all food items would—again—be quite tedious.

 There is another functional method that will help us: `reduce`!

 * callout(Reducing):
 `ingredients.reduce(initialResult: Result, nextPartialResult: (Result, Food) -> Result)`

 It may seem intimidating at first, but let's take a closure (get it?) look at this method, which will prove to be ueful in a variety of places.
 */
//#-hidden-code
import PlaygroundSupport

let page = PlaygroundPage.current
let food = [🍎, 🍓, 🥒, 🥕, 🍃, 🍂]
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, food, isVegetable, isApple, ingredients, item, filter, reduce)
//#-code-completion(keyword, show, let)
//#-editable-code
let ingredients = food
    .filter({ item in item.isVegetable })
    .reduce(🍽, { plate, item in combine(plate, item) })
// TODO: Use code copying!
// TODO: Hints!
//#-end-editable-code
//#-hidden-code
if ingredients == [🥒, 🥕, 🍃] {
    page.assessmentStatus = .pass(
        message: "**Well done!** Our salas is ready to be served 🥗")
} else {
    page.assessmentStatus = .fail(hints: [

    ], solution: nil)
}
//#-end-hidden-code

