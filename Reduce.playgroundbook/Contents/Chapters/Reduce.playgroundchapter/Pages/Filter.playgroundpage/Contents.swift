/*:
 # Welcome 😀

 In this Swift Playground, you will learn how to apply some basic methods from [functional programming](glossary://functional%20programming). They will help you write cleaner, more consice, and thus more readable code. However, a complete introduction to functional programming is outside the scope of this playground, which is intended as a short inspiration of what may be a cool thing to learn.

 # Going All Electric! 💡
 
 Our goal is to calculate the maximum speed of electric cars in the `cars` array. First of all, we want to *filter* our array of cars as we only want to include electric ones in our calculation.

 # Functional Filtering 😎

 Borrowing techniques from *functional programming*, a filter operations becomes as easy as a single method call:

 * callout(Filtering):
 `cars.filter(isIncluded: (Car) -> Bool)`
 
 As you can see, one can state the problem at hand in a [declarative](glossary://declarative%20programming) way, without having to know about the internal implementation. How cool is that? We just provide a [closure](glossary://closure) that—for each car—decides whether it should be included in the resulting array.

 **Modify the code below in a way that `electricCars` only contains cars that have an electric engine!**

 *Watch the animation on the right as you run your code 😉*
 */
//#-hidden-code
import PlaygroundSupport

let page = PlaygroundPage.current
machineProxy = page.liveView as! PlaygroundRemoteLiveViewProxy
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, cars, car, isElectric, speed, .)
//#-code-completion(keyword, show, let)
let cars = [🚗, 🚕, 🚙, 🚌, 🚎, 🏎]
//#-hidden-code
    .visualized
//#-end-hidden-code
//#-editable-code
let electricCars = cars
    .filter { car in <#T##Condition##Bool#> }
//#-end-editable-code
//#-hidden-code
Machine.addBin()
Machine.trigger()

if electricCars == [🚗, 🚙, 🚎] {
    page.assessmentStatus = .pass(
        message: "**Well Done!** With only one line of code, you filtered the array of cars in a *declarative* way 👍\n\n**[Next Page](@next)**")
} else {
    page.assessmentStatus = .fail(hints: [
        "There is an `isElectric` property that might help you 😉"
    ], solution: nil)
}
//#-end-hidden-code
