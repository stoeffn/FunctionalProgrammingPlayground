/*:
 [Previous](@previous)

 # 🥗 Let's Make a Salad!

 Every great meal starts with an enticing appetizer. Therefore, a good old vegetable salad might be a perfect fit. After all, we all care about our health, don't we?

 I've got some ingredients, ranging from strawberries and bananas to carrots and cucumbers. But as we want to preserve the sweet stuff for dessert, we only care about the vegetables we've got. That's why we need to *filter* our list of ingredients.

 Borrowing techniques from *functional programming*, a filter operations becomes as easy as a single method call:

 * callout(Filtering):
 `ingredients.filter(isIncluded: item -> item.isVegetable)`

 As you can see, we are able to state the problem at hand in a *declarative* way, without having to know about the internal implementation. How cool is that? We just provide a closure that—for each item—decides whether it should be included in the resulting list.

 **Let's try to implement the same filter operation as one would have before in order to grasp the difference.**
 */
/*var filteredIngredients = [Ingredient]()
for ingredient in ingredients {
    if ingredient.isVegetable {
        filteredIngredients.append(ingredient)
    }
}*/
//: [Next](@next)
