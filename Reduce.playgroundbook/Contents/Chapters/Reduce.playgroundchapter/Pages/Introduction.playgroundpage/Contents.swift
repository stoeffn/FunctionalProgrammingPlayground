/*:
 # Filter, Map, and Reduce!
 
 In this Swift Playground, you will learn how to apply some basic methods from *functional programming*. They will help you write cleaner, more consice, and thus more readable code. However, a complete introduction to functional programming is outside the scope of this playground, which is intended as a short inspiration of what may be a cool thing to learn.
 
 # Some Statistical Analysis 📈
 
 The code below calculates the maximum speed of electric cars in the `cars` array.
 
 **Can you see how it works?**

 *If not so just watch the animation on the right as you run the code 😉*
 */
//#-hidden-code
import PlaygroundSupport

let page = PlaygroundPage.current
machineProxy = page.liveView as! PlaygroundRemoteLiveViewProxy
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-editable-code
let cars = [🚗, 🚕, 🚙, 🚌, 🚎, 🏎]
//#-end-editable-code
var maxElectricCarSpeed = 0
for car in cars {
    if car.isElectric {
        let speed = car.maxSpeed
        maximumElectricCarSpeed = max(speed, maximumElectricCarSpeed)
    }
}
//#-hidden-code
triggerMachine()
//#-end-hidden-code
