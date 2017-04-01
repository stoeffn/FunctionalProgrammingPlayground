/*:
 # Putting It All Together 🙏

 So far we know how to filter and map array items. Nonetheless, these methods process each item on its own, which is not what we want now.

 However, combining all food items would—again—be quite tedious.

 # Reducing Our Problem ⏭

 There is another functional method that will help us: `reduce`!

 * callout(Reducing):
 `speeds.reduce(initialResult: Result, nextPartialResult: (Result, Speed) -> Result)`

 It may seem intimidating at first, but let's take a closer look at this method, which will prove useful in a variety of places.
 
 `reduce` takes an initial value as well as a closure that combines two values. In our case, we want this closure to return the maximum of those two values.

 **Try to use the `reduce` method in a way that produces the desired value.**
 */
//#-hidden-code
import PlaygroundSupport

let page = PlaygroundPage.current
machineProxy = page.liveView as! PlaygroundRemoteLiveViewProxy
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, cars, car, isElectric, speed, reduce, .)
//#-code-completion(keyword, show, let)
let cars = [🚗, 🚕, 🚙, 🚌, 🚎, 🏎]
//#-hidden-code
    .visualized
//#-end-hidden-code
//#-editable-code
let maxSpeed = cars
    .filter { car in car.isElectric }
    .map { car in car.maxSpeed }
    .reduce(<#T##Initial Value##Speed#>) { lhs, rhs in <#T##Combination##Speed#> }
//#-end-editable-code
//#-hidden-code
triggerMachine()

if maxSpeed == 225 {
    page.assessmentStatus = .pass(
        message: "**Well Done!** You learned how to combine the values of an entire array ✌️\n\n**[Recap](@next)**")
} else {
    page.assessmentStatus = .fail(hints: [
        "The global `max` function returns the maximum of its input, which might be useful 🤔"
    ], solution: nil)
}
//#-end-hidden-code
