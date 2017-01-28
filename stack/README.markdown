# Stack

A stack is a (data) structure made of a sequence of items placed one atop the other. You almost certainly already have an intuitive understanding of how stacks work, because they work the same way outside of a computer as they do in a computer (and don't let anyone tell you any different). Another word for "stack" that you might hear is "LIFO," which stands for "last in, first out."

It's easy to visualize stacks (or LIFOs) because they're so common. For example, the last time you moved house, you might have had to pack your things into boxes. Maybe you pack your silverware first, put it in a box and place it on the floor:

```
______________
|            |
| Silverware |
|____________|
```

Next, you grab your bed linens, put them in a box, and chuck that box on top of the first one:

```
______________
|            |
| Bed Linens |
|____________|
______________
|            |
| Silverware |
|____________|
```

Finally, you pack up your toiletries in the same way:

```
______________
|            |
| Toiletries |
|____________|
______________
|            |
| Bed Linens |
|____________|
______________
|            |
| Silverware |
|____________|
```

Phew, that was a lot of work! You're hungry, so you order some takeout but then, *PLOT TWIST*, the restaurant forgot to include utensils. Dismayed, you look back at your packed things, and realize your forks are all the way at the bottom of your stack of boxes. Since the boxes are in a stack, you can't get to the one on the bottom without first moving the ones above it.

The important thing to notice is that the box you packed *last* is the one you have to move *first*; there's just no way to get to the boxes under it without first moving the top ones. In other words, the last item into the pile is the first one you need to move out. (Hence a stack's jargon name, LIFO, or "last in, first out.") Another way to say this same thing is that emptying a stack must proceed in exactly the reverse order from which it is filled.

Although this fact about stack structures can be frustrating in the physical world, this symmetry can be used to do some awesomely powerful things, and is a useful characteristic for more complex algorithms. But don't let that intimdate you. Underneath it all, a "stack" is just a set of items positioned in a way that only lets you access them in a specific order. Specifically, the reverse order in which you stacked the items in the first place. This explicit *constraint* is the main reason for using stacks.

It might be counter-intuitive to imagine constraints as useful, so let's explore a more practical example of how a "stack" might be used. One common use of stacks is in navigation systems. Imagine you're hiking on a mountain trail. There are many forks in the trail, places where the path splits and you can follow one of two walkways. Your goal is to hike to the top of the mountain and then return to the trailhead that you set off from. The challenge is that the hike will last all day and the forks will look different at night than they do in the daylight.

That's a situation in which you can use a stack to find your way. Before you begin hiking, you pack a deck of index cards and a pen. Then, as you hike *up* the mountain, you write "Left" or "Right" on a blank index card each time you reach a fork in the trail. You place each new card on top of the last card, creating a stack. When you then hike *down* the mountain and reach the first fork, you go the *opposite* direction as the one written on the index card, and put that card away. This technique works because the number of index cards you have will always be the number of "Left" or "Right" choices you made, and to backtrack your own route you always need to take the opposite direction as you did when first navigating.

There are many other real-world problems that can be solved by doing one thing in one direction and the opposite in the other direction. Regardless of how complex the real-world problem is, they can all use this neat feature of stacks to do at least some of their problem solving.

> :construction: TK-TODO: Maybe some more examples? Brace pair matching? Link to [singly linked list](../singly_linked_list/README.markdown), which is a sort of (reverse) stack?

## Further reading

* [Wikipedia](https://en.wikipedia.org/wiki/Stack_%28abstract_data_type%29)
