/*:
 # Let's Make a Salad! 🥗

 Every great meal starts with a delicious appetizer. So a good old vegetable salad might be a perfect fit—after all, we all care about our health, don't we?

 I've already got some ingredients prepared. But as we want to preserve the sweet stuff for dessert, we need to *filter* our list `food`. However, using `for`-loops with nested conditions can become quite cumbersome. Is there a better way? Let me tell you about…
 
 # Functional Filtering 😎

 Borrowing techniques from *functional programming*, a filter operations becomes as easy as a single method call:

 * callout(Filtering):
 `food.filter(isIncluded: (Item) -> Bool)`
 
 The code below filters out ingredients we don't want in our salad. As you can see, we are able to state the problem at hand in a *declarative* way, without having to know about the internal implementation. How cool is that? We just provide a closure that—for each item—decides whether it should be included in the resulting list.
 
 # Did You Check the Expiration Date?

 Me neither… These brown leaves don't look good anymore 😳

 **Use your filtering-skills and make sure there is no ingredient with an `age` over `4` in our list!**
 
 *Watch the animation on the right as you run your code 😉*
 */
//#-hidden-code
import PlaygroundSupport

let page = PlaygroundPage.current
let food = [🍎, 🍓, 🥒, 🥕, 🍃, 🍂]
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, food, isVegetable, isApple, ingredients, item, filter)
//#-code-completion(keyword, show, let)
//#-editable-code
let ingredients = food
    .filter({ item in item.isVegetable })
// TODO: Set assessment status after the animation ends!
//#-end-editable-code
//#-hidden-code
if ingredients == [🥒, 🥕, 🍃] {
    page.assessmentStatus = .pass(
        message: "**Well done!** Now we don't have to worry about expired food anymore 👍🏻")
} else {
    page.assessmentStatus = .fail(hints: [
        "Try using another filter operation or revise the condition 😉",
        "The ingredients should contain 🥒, 🥕, 🍃, and 🍂 but not 🍎 or 🍓."
    ], solution: nil)
}
//#-end-hidden-code
