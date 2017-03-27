/*:
 ## Making It Even Simpler

 Filtering a list of items this way can be quite verbose because one needs to describe every step rather than what needs to be done.

 Using the power of Swift, we can reduce our functional approach even more:

 * callout(Filtering):
 `ingredients.filter { $0.isVegetable }`

 You can extract a trailing closure and use the implicit `$0` parameter instead of naming it.

 ## Another Problem

 Did you check the expiration date? Me neither. Use your new filtering-skills for good and make sure there is no ingredient with an `age` over `4` in our list!
 */

//#-hidden-code
import PlaygroundSupport

let page = PlaygroundPage.current
let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy
//#-end-hidden-code

//#-editable-code Do your magic!
let result = MachineArray(🍏, 🍐, 🍎)
    .filter { $0.isApple }
    .map(eat)
    .reduce(🚽, +)
//#-end-editable-code

//#-hidden-code
proxy.send(.array(result.configuration))
//#-end-hidden-code
