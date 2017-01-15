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

In computer science lingo, this fact about selection sort is described as "using `O(n)` space" (`O(n)` is pronounced "Oh of N"). The `n` means "however many items there are" and the capital letter O with parentheses is a (very academic) way of notating algorithm efficiency, called "Big-Oh notation." We use `n` instead of `4` here because if we had five rows instead of four, the same fact ("there are always the same number of total rows across both tables as the number of rows that we started with in the first table") could be truthfully asserted. In the case of having five rows instead of four, there will always be five total rows, so `n` is a stand-in for whatever that number happens to be for a given dataset's size.

## Time

Another thing to notice about selection sort is that to find the team with the most wins, you have to take a step (check each row of the original table) however many number of times there are rows in that table. Of course, how much *real time* a single "step" takes (1 second or 1 microsecond, etc.) depends on how fast your computer is. The faster your computer, the faster it will be able to accomplish whatever it needs to do in each step.

Even a very slow computer might be fast enough if you only have four items to work on. With so few items, you may not even need a computer! But the whole point of using computers in the first place is to work on datasets that are too big to work on by hand. What if we had many more than just four teams? What if we had one hundred teams, or one thousand teams, or ten thousand teams?

That's a pretty subtle wrinkle, so let's work it out.

In our example, there are four rows, so we say the *n*umber equals four, or `n = 4`. In other words, it takes `4` steps to be sure we've found the very highest number (to find the team with the most wins) because we need to look at the number of wins of *each* team at least once. Then, to find *each* next-highest number (so we end up ordering the teams in a leaderboard), it takes `n - 1` steps.

1. On the first pass, when `n` begins at `4`, it takes four steps to find the most-winning team.
    * After we found that team and remove them from the original table, we also have to look at each *remaining* team's row at least once. Since we've removed one, there will now be three left.
1. Next, we repeat the process we went through when `n` was `4` to find the team with the second-most wins, except this time `n` is `3`.
    * So far, we've taken seven steps: 4 to find the most-winning team, and another 3 to find the second-most winning team (`4 + 3`).
1. When we start looking for the third-most winning team, there are only two teams remaining, but we still have to look at both of them, which takes us two steps.
    * Now we've taken `4 + 3 + 2` steps.
1. At this point, we have only one team left, and one more step to take, which means the whole process takes `4 + 3 + 2 + 1` total steps.

Let's look at that pattern again, more visually. Each circle represents a step:

```
 o o o o    <--   4 steps/items to start, remove one
  o o o     <-- + 3 steps/items remaining, remove one
   o o      <-- + 2 steps/items remaining, remove one
    o       <-- + 1 step remaining, remove it
                ---------
                10 total steps
```

But what if we had ten teams? Let's draw that again, but starting with ten instead of four:

```
 o o o o o o o o o o    <--  10 steps
  o o o o o o o o o     <-- + 9 steps
   o o o o o o o o      <-- + 8 steps
    o o o o o o o       <-- + 7 steps
     o o o o o o        <-- + 6 steps
      o o o o o         <-- + 5 steps
       o o o o          <-- + 4 steps
        o o o           <-- + 3 steps
         o o            <-- + 2 steps
          o             <-- + 1 step
                            ---------
                            55 total steps
```

This results in a clear (triangular) pattern. Here's a table showing that same pattern for every value of `n` between `1` and `10`:

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

The thing to pay attention to is that the more items (rows) we have, the bigger the *difference* between the last total number of steps and the new total number of steps are. This difference grows at a rate proportional to the number of items we add, i.e., it grows by exactly `n`. That may make intuitive sense to you already, because each time we add a row, we are adding `n` steps. The wrinkle is that these are an *additional* `n` steps, not a *total* of `n` steps.

Said another way, when we add one row to a table that had three rows, we end up with a total of four rows and thus have to take all the steps we would have had to take when the table was only three rows long *plus* `4` *additional* steps. Likewise, if we add one more row again, we'd have a total of five rows and thus also add `5` *additional* steps, even more than the `4` we added previously.

In computer science lingo, this fact about selection sort is described as "using `O(n^2)` time" (`O(n^2)` is pronounced "Oh of N-squared" or sometimes just "quadratic"). But *why* is it O(n^2)? To understand that, let's take a closer look at those triangles showing us the total number of steps it takes selection sort to do its work.

Recall that the total number of steps selection sort needs to take to completely order our four-team leaderboard looks something like this:

```
 o o o o    <--   4 steps/items to start, remove one
  o o o     <-- + 3 steps/items remaining, remove one
   o o      <-- + 2 steps/items remaining, remove one
    o       <-- + 1 step remaining, remove it
                ---------
                10 total steps
```

This expression looks like `4 + 3 + 2 + 1 = 10`. That's fine specifically for `4` rows (when `n` is `4`), but how can we find out the total number of steps for *any* number of rows (for *any* value of `n`)? To do that, we need to have noticed the following pattern (and if you didn't, it's okay, because you're about to notice it) in the triangles above:

```
 o o o o <--   4 <---------------------------| first number (4)
  o o o  <-- + 3 <—+ second number (3) plus  | plus
   o o   <-- + 2 <—+ 2nd-to-last number (2)=5| last number  (1)
    o    <-- + 1 <---------------------------| ALSO equals  (5)
```

More visually again, this same pattern:

```
      4 on this side
         | | | |
         v v v v
    4 —> o o o o <— 4
   on —>  o o o  <— on
 this —>   o o   <— this
 side —>    o    <— side, too!
```

This pattern holds no matter how big our triangles get. Adding the first and last number together will always yield the same result as adding the second number and the second-to-last number, the third number with the third-to-last number, and so on. The fact that this pattern holds true for any value of `n` is the key. Knowing this, we can write our procedure out without the triangles:

```
  (4 + 3 + 2 + 1)   <-- Our original procedure.
+ (1 + 2 + 3 + 4)   <-- A copy of our original procedure, reversed.
-----------------
   5 + 5 + 5 + 5    <-- Each pair added to its reversed copy.
```

Again, the important thing is that the sum of each pair is always the same! It's `5`, our original number (`4`) plus one. (That means we can we can replace `5` with `n + 1` later on). Now we have four copies of `5` all added together: `5 + 5 + 5 + 5` or, written more concisely, `4 * 5`, which totals `20`. But remember that we added together *two* copies of our original numbers, so the actual total number of steps is *half* that, or `4 * 5 / 2`, which totals `10`.

So now we know that the total number of steps selection sort needs to take to finish working on a dataset of `n` items is `n * (n + 1) / 2`; we've replaced `4` with `n` and replaced `5` with `n + 1` to generalize the expression. Once again, we can visualize this more clearly by drawing it out with triangles. We start with one:

```
    o     <--   + 1 step
```

And we have a total of `n` steps:

```
 o o o o  <--   "n" steps
```

Finally, we know that we will need to pass over the data however many times there were items in the dataset to begin with, which in our case was `n`:

```
                        ——
    o     <--   + 1 step  \
  ……………   <--              »  "n" times
 o o o o  <--   "n" steps /
                        ——
```

When computer scientists talk about "Big-O," they're only talking about an approximation for super large numbers. Big-O isn't very useful for numbers like 10. So let's look at `n * (n + 1) / 2` and pretend like `n` is a much bigger number such as, say, ten thousand.

What is half of a really big number (i.e., "a really big number divided by two")? *Still* a really big number. To make the point, let's look at 10,000. That's a ten with *three* zeros after it. What's half of 10,000? It's 5,000, which is *also* a number with three zeros after it. Both numbers are "three orders of magnitude" in size, so as far as computer notation is concerned, both are (basically) the same. A program which needs to take 10,000 steps to complete won't be noticably different to a human than a program which needs to take 5,000 steps to complete.

This is all to say that (for really big values of `n`), `n * (n + 1) / 2` is basically the same as `n * (n + 1)`, without the `/ 2` at the end. The `/ 2` just isn't important. By the same logic, a really big number `+ 1` is *also* a really big number. So, when dealing with Big-O notation, we can safely drop the `+ 1` as well. For all we care, `10,000 + 1` might as well be `10,000`.

So again, `n * (n + 1)` might as well be `n * (n)`, or just `n * n`. In mathemtical notation, `n * n` is just another way of writing n<sup>2</sup>. So, for very large values of `n`, `n * (n + 1) / 2` is *basically* the same as n<sup>2</sup>. That's all that O(n<sup>2</sup>) means: it means "something's that *basically* the same as n<sup>2</sup> whenever the `n`'s are really big numbers."

Keep in mind that when talking about how fast an algorithm works (how many steps it would take to complete), its rate of growth matters much more than whatever number `n` happens to be, because the point of an algorithm is that it can be applied to any value of `n`. The problem is that a slow algorithm (like selection sort) is only really useful for small values of `n` (that is, for small amounts of data). In other words, you *can* use selection sort to order a list of 10,000 items. However, if it takes your computer 1 second to complete each "step," then you'll be waiting fifty million five thousand seconds or one and a half *years* for the algorithm to complete. Even if each step took only 1 *micro*second (one thousandth of a second), you'd still be waiting 5.7 *days* for it to finish. That's a long time to wait for your computer to do something.

That's why selection sort is used only when there are an acceptably small number of items to order, and even then, only if there isn't much memory space to do it in.

## Footnotes

### Footnote 1

Since selection sort makes changes to the list it was given as it's sorting it, computer programmers call this an ["in-place" algorithm](https://en.wikipedia.org/wiki/In-place_algorithm).

## Further reading

1. [Wikipedia](https://en.wikipedia.org/wiki/Selection_sort)
1. [Big O notation - Wikipedia](https://en.wikipedia.org/wiki/Big_O_notation)
1. [Triangular number - Wikipedia](https://en.wikipedia.org/wiki/Triangular_number)
1. [Visualization of the triangular number formula](https://web.archive.org/web/20170110221917/http://i1115.photobucket.com/albums/k544/akinuri/nth%20triangle%20number-01.jpg)
1. [Quadratic time - Wikipedia](https://en.wikipedia.org/wiki/Quadratic_time)
1. [Order of magnitude - Wikipedia](https://en.wikipedia.org/wiki/Order_of_magnitude)
