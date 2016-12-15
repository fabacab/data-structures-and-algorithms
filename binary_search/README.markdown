# Binary search

The binary search algorithm is a method to quickly find a given item in a list (called a "search space") that has already been sorted. The word "binary" in its name can be misleading because it refers to halving the search space (dividing the search space by two) at each attempt to find the thing you're looking for. You don't need to know anything about binary math to use it!

In order to be useful, the list or search space you're looking through must already be sorted. Some examples of things that are sorted include number lines (because `1` always comes before `2`, and so on) or alphabets (because `A` always comes before `B`, and so on). For instance, the dictionary is a *sorted* list of words; it's sorted because it's alphabetized and you are certain to find "Aardvark" well before you encounter the word "Zebra" if you simply read it from beginning to end (i.e., if you read the dictionary linearly).

When you perform a binary search, you start in the middle of the search space instead of at its beginning or its end. If the item you're looking for is not the item in the exact middle, you check to see if it's supposed to be listed before or after that middle item. This is why it's so important for the list to be sorted before you try to do a binary search in it. If you try to apply the binary search algorithm to a search space that is not sorted, it won't work because you won't know which half of the list to keep looking in.

Here's a simple visualization showing how halving the search space works. If there are eight items in the search space, and they're sorted, then you only need up to three guesses to find any item (and then one more "guess" to actually pick it out):

```
Search space:       |__1__|__2__|__3__|__4__|__5__|__6__|__7__|_*8__| "Guess a number from 1 to 8." (It's 8.)
Before first guess: |_______________________________________________|
After first guess:  |xxxxxxxxxxxxxxxxxxxxxxx|_______________________| "If it's not four, is it bigger or smaller than four?"
After second guess: |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|___________| "If it's not six, is it bigger or smaller than six?"
After third guess:  |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|_____| "If it's not seven, is it bigger or smaller than seven?"
Fourth "guess":     |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|FOUND| "It's eight!"
```

Here's another example:

```
Search space:       |__1__|__2__|_*3__|__4__|__5__|__6__|__7__|__8__| "Guess a number from 1 to 8." (It's 3.)
Before first guess: |_______________________________________________|
After first guess:  |_______________________|xxxxxxxxxxxxxxxxxxxxxxx| "If it's not four, is it bigger or smaller than four?"
After second guess: |xxxxx|_____|_____|xxxxxxxxxxxxxxxxxxxxxxxxxxxxx| "If it's not two, is it bigger or smaller than two?"
After third guess:  |xxxxxxxxxxx|_____|xxxxxxxxxxxxxxxxxxxxxxxxxxxxx| "It's bigger than two but smaller than four, so..."
Fourth "guess":     |xxxxxxxxxxx|FOUND|xxxxxxxxxxxxxxxxxxxxxxxxxxxxx| "that means it must be three!"
```

Notice that the search space shrinks by half after each guess. If you guess `4` but the answer is `8`, then you can safely discard `1`, `2`, and `3`, because these are even lower than `4`, which you're told is too low and is what you guessed first. Rather than guessing `5` next, find the middle of the remaining search space and guess that item (`6`). Then check if your guess is correct, or if it's too high or too low. Keep guessing in the middle of the remaining search space until there's only one possibility left. Now you can see why a *sorted* input is so important for binary search to work!

The important pattern to notice is that the number of possible correct answers (the "search space") is reduced by half after each guess:

* 8 possible answers *before* the first guess.
* 4 possible answers *after* the first guess.
* 2 possible answers after the second guess.
* 1 possible answer after the third guess.

Notice that in the second example, however, we didn't even need to use a third guess, because there was only one possible answer after the second guess. Three guesses is the *slowest* it would take to find the answer in a set of eight items, not the fastest. This is still potentially much faster than a worst-case scenario if we used a *linear* search instead of a *binary* search. If we used a linear search, it would have taken us 8 guesses to guess the number 8 in the first example if we started guessing at 1, because our next guess would have been 2, then 3, and so on.

Binary search is also sometimes called *logarithmic search* because the search speed is calculatable by taking a logarithm of the length of the list. A logarithm is the opposite of an exponent. 2 raised to the power of 3 (that is, 2 multiplied by itself 3 times) equals eight (2<sup>3</sup> = 8). We can retrieve the exponent (the 3, which is the most guesses we'd need to search an 8-item list) by applying the logarithm function to the number 8 (the size of our search space) with a base of 2 (because we're halving the space at each guess): log<sub>2</sub>8 = 3.

Using logarithmic math, you can easily find out how many guesses it would take you to find a given item in an arbitrarily large search space. For instance, if you had to guess a number between 1 and 100, it would take you at most log<sub>2</sub>100 guesses if you always halved the search space at each guess (i.e., if you "used binary search").

## Further reading

1. [Khan Academy](https://www.khanacademy.org/computing/computer-science/algorithms/binary-search/a/binary-search)
1. [RosettaCode](http://rosettacode.org/wiki/Binary_search)
1. [Working with Exponents and Logarithms](https://www.mathsisfun.com/algebra/exponents-logarithms.html)
1. [Binary Search - Wikipedia](https://en.wikipedia.org/wiki/Binary_search_algorithm)
1. [Logarithm - Wikipedia](https://en.wikipedia.org/wiki/Logarithm)
