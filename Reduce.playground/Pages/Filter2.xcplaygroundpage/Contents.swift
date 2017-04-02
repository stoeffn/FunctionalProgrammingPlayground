/*:
 [Previous](@previous)

 ## Making It Even Simpler

 Filtering an array of items this way can be quite verbose because one needs to describe every step rather than what needs to be done.

 Using the power of Swift, we can reduce our functional approach even more:

 * callout(Filtering):
 `ingredients.filter { $0.isVegetable }`

 You can extract a trailing closure and use the implicit `$0` parameter instead of naming it.
 
 ## Oh-Oh
 
 Did you check the expiration date? Me neither. Use your new filtering-skills for good and make sure there is no ingredient with an `age` over `4` in our array!
 */

//ingredients
//    .filter { $0.isVegetable && $0.age <= 4 }

//: [Next](@next)
