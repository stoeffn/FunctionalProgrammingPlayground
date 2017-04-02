/*:
 # Recap 🎓

 Functional programming provides concise ways for declarativly expressing a problem rather than the solution, which can help you *reduce* [boilerplate code](glossary://boilerplate%20code). If this tip of the iceberg got you intrigued you should definitly check out more tutorials on this topic 😉
 
 # Making It Even Simpler 😱
 
 Using the power of Swift, you can simplify your code even more! Notice the [implicit closure parameters](glossary://implicit%20closure%20parameter) and reference to the `max`-function?

 **Just play around and apply what you've learned ☺️**
 
 * Experiment: ````
 let food = [🥔, 🌾, 🐖]
    .map { $0.processed }
 ````
 
 *The animation on the right will adapt automatically to your code. Maybe try adding new operations? Or cook some food?*
 
 ---
 
 *I hope you enjoyed my Swift Playground—Thanks for considering me!*
 */
//#-hidden-code
import PlaygroundSupport

let page = PlaygroundPage.current
machineProxy = page.liveView as! PlaygroundRemoteLiveViewProxy
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, cars, car, isElectric, speed, reduce, max, food, items, item, processed, isVegetable, isApple, 🚗, 🚕, 🚙, 🚌, 🚎, 🏎, 🥔, 🌾, 🐖, .)
//#-code-completion(keyword, show, let)
let /*#-editable-code Name*/cars/*#-end-editable-code*/ = [/*#-editable-code items*/🚗, 🚕, 🚙, 🚌, 🚎, 🏎/*#-end-editable-code*/]
//#-hidden-code
    .visualized
//#-end-hidden-code
//#-editable-code
let maxSpeed = cars
    .filter { $0.isElectric }
    .map { $0.maxSpeed }
    .reduce(0, max)
//#-end-editable-code
//#-hidden-code
Machine.addBin()
Machine.trigger()
//#-end-hidden-code
