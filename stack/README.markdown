# Stack

A stack is a (data) structure made of a sequence of items placed on atop the other. You almost certainly already have an intuitive understanding of how stacks work, because they work the same way outside of a computer as they do in a computer (and don't let anyone tell you any different). Another word for "stack" that you might hear is "LIFO," which stands for "last in, first out."

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

Phew, that was a lot of work! You're hungry, so you order some takeout but then, *PLOT TWIST*, the restaurant forgot to include utensils. Dismayed, you look back at your packed things, and realize your forks are all the way at the bottom of your stack of boxes! Since the boxes are in a stack, you can't get to the one on the bottom without first moving the ones above it.

The important thing to notice is that the box you packed *last* is the one you have to move *first*; there's just no way to get to the boxes under it without first moving the top ones! In other words, the last item into the pile is the first one you need to move out. (Hence a stack's jargon name, LIFO, or "last in, first out.") Another way to say this same thing is that emptying a stack must proceed in exactly the reverse order from which it is filled.

Although this fact about stack structures can be frustrating in the physical world, this symmetry can be used to do some awesomely powerful things.

> :construction: TK-TODO: Maybe some more examples? Brace pair matching? Link to [singly linked list](../singly_linked_list/README.markdown), which is a sort of (reverse) stack? Navigation backtracking?

## Further reading

* [Wikipedia](https://en.wikipedia.org/wiki/Stack_%28abstract_data_type%29)
