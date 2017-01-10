# Selection sort

The selection sort algorithm is a simple technique that takes a set of unordered items and orders them according to some criteria about each item that can be compared against the other items. Common examples of sort order are "highest to lowest" or "alphabetically." For instance, you might have been keeping a table of sports teams and the number of games they've each won:

| Team    | Wins |
|---------|------|
| Pirates | 4    |
| Robots  | 5    |
| Aliens  | 8    |
| Ninjas  | 6    |

Before you can do interesting things with this data, you'll often need to sort it. (For instance, [binary search](../binary_search/README.markdown) requires a *sorted* list.) You could sort this data alphabetically by team name, so that you can use it like a sports league catalog:

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

In either case, you can use selection sort to take your unordered data and order it as you want. It works just like you might expect. Let's say we want to make a leaderboard. In that case we can go from the unordered data to the ordered data by doing this:

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
1. Take your finger and put it next to the first row of the original table. This will help us keep track of where we are.
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
1. For all of the remaining rows in our table, compare that team's win count with our remembered highest number, replacing the highest number with the new team's win count if it is higher than what we remembered:
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

This process is very intuitive. It might even have been how you would've gone about sorting the data in the table "by hand." The name "selection sort" might make it sound more complicated than it really is, but that's all there is to it.

One thing to notice about selection sort is that after looking through all the items, we remove the "selected" item out of the original data and add it to the new data. This makes selection sort very space-efficient. At no time do we have more than 4 rows across the two tables (the same number of rows we started with). This feature makes selection sort a useful algorithm in situations where you are constrained by the amount of space you have available.

On the other hand, notice that to find the row with the most wins, you have to check each row however many number of times there are rows in the table. In our example, there are four rows, so we can say the `n`umber equals 4, or `n = 4`. In other words, it takes `4` steps to find the very highest number. But to find each next-highest number, it takes `n - 1` steps. When `n` is `4` this means it takes `4 + 3 + 2 + 1 = 10` steps. That's 10 steps for a table with just 4 rows, so you can begin to see that selection sort is not very fast.

That might be fast enough if you only have four items of data, but for each additional row we add to the table, the number of steps increases by however many rows we have (i.e., it increases by `n`). For example, if we had five rows instead of four (i.e., when `n = 5`), then the number of steps it would take to sort the leaderboard would be `5 + 4 + 3 + 2 + 1 = 15`. With six rows, it would `6 + 5 + 4 + 3 + 2 + 1 = 21`. With seven, it totals `28`, with eight the total grows to `36`, and so on. Here's a table showing that pattern:<sup>[1](#footnote-1)</sup>

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

The key insight here is that with each order of magnitude we don't just increase the number of steps by ten times. Instead, the increase in the number of total steps is much closer to *exponential* growth. To understand this more fully, compare the following two patterns against one another.

First let's look simply at orders of magnitude. An order of mangitude is the number of times we multiply a number by a factor of ten. That means:

1. One order of magnitude is `10` multiplied by itself one time (`10 * 1 = 10`).
1. Two orders of magnitude is ten multiplied by itself *ten* times (`10 * 10 = 100`).
1. Three orders of magnitude is ten multipled by itself one *hundred* times (`10 * 100 = 1,000`).
1. Four orders of magnitude is ten multiplied by itself one *thousand* times (`10 * 1,000 = 10,000`).

Notice that at each order of magnitude, we simply add another zero. Now compare that pattern with the table above:

1. With 10 rows, selection sort would need to take a total of 55 steps to produce an ordered leaderboard. But one order of magnitude of ten is only 10, so we need to take 45 more steps (`55 - 10 = 45`).
1. With 100 rows, we need five thousand fifty steps. But two orders of mangitude of ten is only 100, so we need to take 4,950 more steps (`5,050 - 100 = 4,950`).
1. With 1,000 rows, we need five hundred thousand five hundred steps. But three orders of mangitude of ten is only 1,000, so we need to take 499,500 more steps (`500,500 - 1,000 = 499,500`).
1. With 10,000 rows, we need fifty million five thousand steps. But four orders of magnitude of ten is only 10,000, so we need to take 49,995,000 more steps (`50,005,000 - 10,000 = 49,995,000`).

As you can see, each step adds many more steps than you might intuitively assume. Moreover, when talking about how fast an algorithm works, this rate of growth matters much more than whatever number `n` happens to be, because the point of an algorithm is that it can be applied to any value of `n`. The problem is that a slow algorithm (like selection sort) is only really useful for small values of `n` (for small amounts of data). In other words, you *can* use selection sort to order a list of 10,000 items. However, if it takes your computer 1 second to complete each "step," then you'll be waiting fifty million five thousand seconds or one and a half *years* for the algorithm to complete. Even if each step took only 1 *micro*second (one thousandth of a second), you'd still be waiting 5.7 *days* for it to finish. That's a long time to wait for your computer to do something.

That's why selection sort is used only when there are an acceptably small number of items to order, and even then, only if there isn't much memory space to do it in.

## Footnotes

### Footnote 1

This sequence of numbers is a famous pattern called the [triangular numbers](https://en.wikipedia.org/wiki/Triangular_number).

## Further reading

1. [Wikipedia](https://en.wikipedia.org/wiki/Selection_sort)
1. [Visualization of the triangular number formula](https://web.archive.org/web/20170110221917/http://i1115.photobucket.com/albums/k544/akinuri/nth%20triangle%20number-01.jpg)
1. [Order of magnitude - Wikipedia](https://en.wikipedia.org/wiki/Order_of_magnitude)
