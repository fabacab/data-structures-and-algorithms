# Selection sort

The selection sort algorithm is a simple technique that takes a set of unordered items and orders them according to some characteristic that can be compared against each other item. Common examples of sort order are "highest to lowest" or "alphabetically." For instance, you might have been keeping a table of sports teams and the number of games they've each won:

| Team    | Wins |
|---------|------|
| Pirates | 4    |
| Robots  | 5    |
| Aliens  | 8    |
| Ninjas  | 6    |

Before you can do interesting things with this data, you'll often need to sort it. (For instance, [binary search](../binary_search/README.markdown) requires a *sorted* list.) You could sort this data alphabetically by team name, so that you can use it like a league catalog:

| Team    | Wins |
|---------|------|
| Aliens  | 8    |
| Ninjas  | 6    |
| Pirates | 4    |
| Robots  | 5    |

Or perhaps you want it to be a leaderboard. In that case, it needs to show the team with the most wins first, and the least wins last:

| Team    | Wins |
|---------|------|
| Aliens  | 8    |
| Ninjas  | 6    |
| Robots  | 5    |
| Pirates | 4    |

In either case, you can use selection sort to take your unordered data and order it as you want. The algorithm works rather intuitively: we examine the data a number of times, each time "selecting" the item that matches our criteria (hence the name). Let's say we want to make a leaderboard. In that case, each time we examine the data, we select the team with the most wins. To go from the unordered data to a leaderboard would take these steps:

1. Make a new, empty table alongside our original table:
    ```
    Step 1:

      ORIGINAL TABLE           NEW TABLE

    | Team    | Wins |     | Team    | Wins |
    |---------|------|     |---------|------|
    | Pirates | 4    |
    | Robots  | 5    |
    | Aliens  | 8    |
    | Ninjas  | 6    |
    ```
1. Take your finger and put it next to the first row of the original table. This is to keep track of where we are.
    ```
    Step 2:

          ORIGINAL TABLE           NEW TABLE

        | Team    | Wins |     | Team    | Wins |
        |---------|------|     |---------|------|
    --> | Pirates | 4    |
        | Robots  | 5    |
        | Aliens  | 8    |
        | Ninjas  | 6    |
    ```
1. Note that team's win count. (It's `4`.) Let's remember this number as our "highest number so far."
    ```
    Step 3:

          ORIGINAL TABLE           NEW TABLE

        | Team    | Wins |     | Team    | Wins |
        |---------|------|     |---------|------|
    -->*| Pirates | 4    |HI: 4
        | Robots  | 5    |
        | Aliens  | 8    |
        | Ninjas  | 6    |
    ```
1. For all of the remaining rows in our table, compare that team's win count with the highest number we remember, replacing it with the new team's win count if it is higher than what we read before:
    ```
    Step 4.1:

          ORIGINAL TABLE           NEW TABLE

        | Team    | Wins |     | Team    | Wins |
        |---------|------|     |---------|------|
        | Pirates | 4    |
    -->*| Robots  | 5    |HI: 5
        | Aliens  | 8    |
        | Ninjas  | 6    |

    Step 4.2:

          ORIGINAL TABLE           NEW TABLE

        | Team    | Wins |     | Team    | Wins |
        |---------|------|     |---------|------|
        | Pirates | 4    |
        | Robots  | 5    |
    -->*| Aliens  | 8    |HI: 8
        | Ninjas  | 6    |

    Step 4.3:

          ORIGINAL TABLE           NEW TABLE

        | Team    | Wins |     | Team    | Wins |
        |---------|------|     |---------|------|
        | Pirates | 4    |
        | Robots  | 5    |
       *| Aliens  | 8    |HI: 8
    --> | Ninjas  | 6    |
    ```
1. When we reach the end of the table, move the row with the highest win count from the original table to the new one:
    ```
          ORIGINAL TABLE           NEW TABLE

        | Team    | Wins |     | Team    | Wins |
        |---------|------|     |---------|------|
        | Pirates | 4    |     | Aliens  | 8    |
        | Robots  | 5    |
        | Ninjas  | 6    |
    ```
1. Repeat the process from step 2 to the end of the table again.

Here's a visualization of each remaining step in the process:

```
      ORIGINAL TABLE           NEW TABLE

    | Team    | Wins |     | Team    | Wins |
    |---------|------|     |---------|------|
-->*| Pirates | 4    |HI: 4| Aliens  | 8    |
    | Robots  | 5    |
    | Ninjas  | 6    |


      ORIGINAL TABLE           NEW TABLE

    | Team    | Wins |     | Team    | Wins |
    |---------|------|     |---------|------|
    | Pirates | 4    |     | Aliens  | 8    |
-->*| Robots  | 5    |HI: 5
    | Ninjas  | 6    |


      ORIGINAL TABLE           NEW TABLE

    | Team    | Wins |     | Team    | Wins |
    |---------|------|     |---------|------|
    | Pirates | 4    |     | Aliens  | 8    |
    | Robots  | 5    |
-->*| Ninjas  | 6    |HI: 6


      ORIGINAL TABLE           NEW TABLE

    | Team    | Wins |     | Team    | Wins |
    |---------|------|     |---------|------|
    | Pirates | 4    |     | Aliens  | 8    |
    | Robots  | 5    |     | Ninjas  | 6    |


      ORIGINAL TABLE           NEW TABLE

    | Team    | Wins |     | Team    | Wins |
    |---------|------|     |---------|------|
-->*| Pirates | 4    |HI: 4| Aliens  | 8    |
    | Robots  | 5    |     | Ninjas  | 6    |


      ORIGINAL TABLE           NEW TABLE

    | Team    | Wins |     | Team    | Wins |
    |---------|------|     |---------|------|
    | Pirates | 4    |     | Aliens  | 8    |
-->*| Robots  | 5    |HI: 5| Ninjas  | 6    |


      ORIGINAL TABLE           NEW TABLE

    | Team    | Wins |     | Team    | Wins |
    |---------|------|     |---------|------|
    | Pirates | 4    |     | Aliens  | 8    |
                           | Ninjas  | 6    |
                           | Robots  | 5    |


      ORIGINAL TABLE           NEW TABLE

    | Team    | Wins |     | Team    | Wins |
    |---------|------|     |---------|------|
-->*| Pirates | 4    |HI: 4| Aliens  | 8    |
                           | Ninjas  | 6    |
                           | Robots  | 5    |


      ORIGINAL TABLE           NEW TABLE

    | Team    | Wins |     | Team    | Wins |
    |---------|------|     |---------|------|
                           | Aliens  | 8    |
                           | Ninjas  | 6    |
                           | Robots  | 5    |
                           | Pirates | 4    |
```

That's it. There's no magic! This process might even have been how you would've gone about sorting the data in the table "by hand."

## Space

One thing to notice about selection sort is that there are always the same number of total rows across both tables as the number of rows that we started with in the first table. This is because after looking through all the items, we remove the "selected" item from the original data and add it to the new data.<sup>[1](#footnote-1)</sup> This makes selection sort very space-efficient; at no time do we have more than 4 rows across the two tables (the same number of rows we started with).

In computer science lingo, this fact about selection sort is described as "using `O(n)` space" (`O(n)` is pronounced "Oh of N"). The `n` means "however many items there are" and the capital letter O with parentheses is a (very academic) way of notating algorithm efficiency. We use `n` instead of `4` here because if we had five rows instead of four, the same fact ("there are always the same number of total rows across both tables as the number of rows that we started with in the first table") could be truthfully asserted. In the case of having five rows instead of four, there will always be five total rows, so `n` is a stand-in for whatever that number happens to be for a given dataset's size.

## Time

Another thing to notice about selection sort is that to find the team with the most wins, you have to check each row of the original table however many number of times there are rows in that table. In our example, there are four rows, so we say the *n*umber equals 4, or `n = 4`. In other words, it takes `4` steps to find the very highest number. But to find each next-highest number and completely sort the leaderboard, it takes `n - 1` steps. When `n` is `4` this means it takes `4 + 3 + 2 + 1 = 10` steps. That's 10 steps for a table with just 4 rows. Of course, how much *actual time* a single "step" takes (1 second or 1 microsecond, etc.) depends on how fast your computer is. The faster your computer, the faster it will be able to accomplish whatever it needs to do in each step.

Even if your computer is very slow, it might be fast enough if you only have four items of data. (With so few items, you may not even need a computer!) But for each additional row we add to the table, the number of steps increases by however many rows we have (i.e., it increases by `n`). For example, if we had five rows instead of four (i.e., when `n = 5`), then the number of steps it would take to sort the leaderboard would be `5 + 4 + 3 + 2 + 1` making a total of `15` steps. With six rows, it would be `6 + 5 + 4 + 3 + 2 + 1` equaling `21`. With seven rows, the total steps rise to `28`, and so on. Here's a table showing that pattern:<sup>[2](#footnote-2)</sup>

| Rows (`n`) | Total steps |
|------------|-------------|
| 1          | 1           |
| 2          | 3           |
| 3          | 6           |
| 4          | 10          |
| 5          | 15          |
| 6          | 21          |
| 7          | 28          |
| 8          | 36          |
| 9          | 45          |
| 10         | 55          |
| …          | …           |
| 100        | 5,050       |
| …          | …           |
| 1,000      | 500,500     |
| …          | …           |
| 10,000     | 50,005,000  |

The key insight here is that the more items (rows) we have, the bigger *the difference* between the number of total steps grows. This makes intuitive sense, because each time we add a row, we are adding `n` steps. When we add one row to a table with three rows, we have a total of four rows and thus add `4` *additional* steps to the sorting procedure. But when we add one more row again, we have a total of five rows and thus also add `5` additional steps, more than the `4` we added previously.

Mathematically, this rate of growth can be expressed as n<sup>2</sup> (pronounced "n-squared", and sometimes written like `n^2`). Again, `n` is the number of rows we have. To see why we square `n`, let's add a third column to the previous table. Since we're interested in the rate of growth, the third column will be the total number of steps for each value of `n` *and* the total number of steps for the *previous* value of `n` added together:

| Rows (`n`) | Total steps for `n` | Growth = total steps for this `n` plus previous `n`'s total steps = n<sup>2</sup> |
|------------|---------------------|-----------------------------------------------------------------------------------|
| 1          | 1                   | 1 = 1 + 0 = 1<sup>2</sup>                                                         |
| 2          | 3                   | 4 = 3 + 1 = 2<sup>2</sup>                                                         |
| 3          | 6                   | 9 = 6 + 3 = 3<sup>2</sup>                                                         |
| 4          | 10                  | 16 = 10 + 6 = 4<sup>2</sup>                                                       |
| 5          | 15                  | 25 = 15 + 10 = 5<sup>2</sup>                                                      |
| 6          | 21                  | 36 = 21 + 15 = 6<sup>2</sup>                                                      |
| 7          | 28                  | 49 = 28 + 21 = 7<sup>2</sup>                                                      |
| 8          | 36                  | 64 = 36 + 28 = 8<sup>2</sup>                                                      |
| 9          | 45                  | 81 = 45 + 36 = 9<sup>2</sup>                                                      |
| 10         | 55                  | 100 = 55 + 45 = 10<sup>2</sup>                                                    |
| …          | …                   | …                                                                                 |
| 100        | 5,050               | 10,000 = 5,050 + 4,950 = 100<sup>2</sup>                                          |
| …          | …                   | …                                                                                 |
| 1,000      | 500,500             | 1,000,000 = 500,500 + 499,500 = 1,000<sup>2</sup>                                 |
| …          | …                   | …                                                                                 |
| 10,000     | 50,005,000          | 100,000,000 = 50,005000 + 49,995,000 = 10,000<sup>2</sup>                         |

Indeed, raising `n` to the power of `2` (multiplying whatever number `n` is by itself) gets us the total number of steps for `n`'s previous value's total steps *and* the total steps for the current value of `n`. In computer science lingo, this fact about selection sort is described as "using `O(n^2)` time" (`O(n^2)` is pronounced "Oh of N-squared" or sometimes just "quadratic"). As you can see, this so called "Big-Oh notation" is used to describe an algorithm's utilization of both space and time resources.

When talking about how fast an algorithm works (how many steps it would take to complete), its rate of growth matters much more than whatever number `n` happens to be, because the point of an algorithm is that it can be applied to any value of `n`. The problem is that a slow algorithm (like selection sort) is only really useful for small values of `n` (that is, for small amounts of data). In other words, you *can* use selection sort to order a list of 10,000 items. However, if it takes your computer 1 second to complete each "step," then you'll be waiting fifty million five thousand seconds or one and a half *years* for the algorithm to complete. Even if each step took only 1 *micro*second (one thousandth of a second), you'd still be waiting 5.7 *days* for it to finish. That's a long time to wait for your computer to do something.

That's why selection sort is used only when there are an acceptably small number of items to order, and even then, only if there isn't much memory space to do it in.

## Footnotes

### Footnote 1

Since selection sort makes changes to the list it was given as it's sorting it, computer programmers call this an ["in-place" algorithm](https://en.wikipedia.org/wiki/In-place_algorithm).

### Footnote 2

This sequence of numbers is a famous pattern called the [triangular numbers](https://en.wikipedia.org/wiki/Triangular_number). The triangular number expression is `n( (n+1) / 2)` read as "n times n-plus-one divided by two." Try it out yourself with some values of `n` shown in the table above. For instance, when `n = 4`, you'll do `4( (4+1) / 2)`, or "four times four-plus-one divided by two." We have to do the math in the inner-most parenthetical expression first. When we work that out step by step, we see:

1. `4( (4+1) / 2)`, so we first do `4+1` and get `5`.
1. `4( (5) / 2 )`, so next we do `5 / 2` and get `2.5`.
1. `4( 2.5 )`, and finally we do `4 * 2.5` and get…
1. `10`, the result of the expression.

Indeed, as we saw above, the selection sort algorithm needs to take `10` steps to order a dataset of `4` items. The triangular number expression lets us find out how many steps selection sort would take to complete given any value of `n`.

## Further reading

1. [Wikipedia](https://en.wikipedia.org/wiki/Selection_sort)
1. [Big O notation - Wikipedia](https://en.wikipedia.org/wiki/Big_O_notation)
1. [Visualization of the triangular number formula](https://web.archive.org/web/20170110221917/http://i1115.photobucket.com/albums/k544/akinuri/nth%20triangle%20number-01.jpg)
1. [Quadratic time - Wikipedia](https://en.wikipedia.org/wiki/Quadratic_time)
