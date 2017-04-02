/*:
 # Faster Than a Speeding Bullet ⚡️

 Great! We've got a filtered array of the cars we want. What we need to do now is get each car's speed as this is the only property we car about.
 
 However, it would be quite cumbersome to iterate over our array of electric cars and adding each car's speed to a new array. In a sense, we want to convert or *map* each car. The term mapping stems from mathmatics, by the way ☺️

 # Mastering Mapping 🗺

 The `map` method applies a transform to each item in a list, individually. What's more, we just have to provide a method that operates on a single car.

 * callout(Mapping):
 ````cars.map(transform: (Car) -> Any)````

 **Sounds cool? Let's try it out!**
 
 *Another cool thing you might notice is the ability to `chain` functional calls. This is made possible considering a functional operation usually returns another object with functional methods.*
 */
//#-hidden-code
import PlaygroundSupport

let page = PlaygroundPage.current
machineProxy = page.liveView as! PlaygroundRemoteLiveViewProxy
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, cars, car, isElectric, maxSpeed, .)
//#-code-completion(keyword, show, let)
let cars = [🚗, 🚕, 🚙, 🚌, 🚎, 🏎]
    //#-hidden-code
    .visualized
//#-end-hidden-code
//#-editable-code
let speeds = cars
    .filter { car in car.isElectric }
    .map { car in <#Operation#> }
//#-end-editable-code
//#-hidden-code
Machine.addBin()
Machine.trigger()

// If `speeds` has a wrong type, the compiler will yield an error. In order to hide this kind of error, the textual
// representation is being compared instead.
if speeds.description == "[225, 210, 120]" {
    page.assessmentStatus = .pass(
        message: "**Well Done!** You just converted an entire array using—again—just one line of code 👌\n\n**[Next Page](@next)**")
} else {
    page.assessmentStatus = .fail(hints: [
        "There is a `maxSpeed` property that might help you 😉"
    ], solution: nil)
}
//#-end-hidden-code
