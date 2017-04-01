/*:
 # Recap 🎓

 Functional programming provides concise ways for declarativly expressing a problem rather than the solution. If this tip of the iceberg got you intrigued you should definitly check out more tutorials on this topic 😉
 
 # Making It Even Simpler 😱
 
 Using the power of Swift, you can simplify your code even more! There are implicit closure parameters and a built-in `max`-method for arrays!

 **Just play around and apply what you've learned ☺️**
 
 *The animation on the right will adapt automatically to your code. Maybe try adding new operations?*
 
 ---
 
 *I hope you enjoyed my Swift Playground—Thanks for considering me!
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
    .filter { $0.isElectric }
    .map { $0.maxSpeed }
    .max()
//#-end-editable-code
//#-hidden-code
triggerMachine()
//#-end-hidden-code
