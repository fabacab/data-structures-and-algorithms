# Singly linked list

A singly linked list is a data structure made of a sequence of items, or elements, each of which points to the next element in the sequence. The last element in the list is the only exception to this rule, since it cannot point to a next element by virtue of being the last one. The name "linked list" can be confusing because there is no literal "linking" going on; the elements are not joined together in any physical way. Instead, the name "linked" refers merely to a given element's own knowledge of where the next element is.

You might already be familiar with the way a singly linked list works, because it's similar to a treasure hunt. Each clue in a treasure hunt points you toward the next clue, which in turn points you to the next one, until finally you reach the treasure at the end. The treasure hunt is like a singly linked list, since it is made up of a sequence of clues. The clues are like the individual elements in the list. To start the treasure hunt, you need to know the location of the first clue. That first clue knows the location of the second clue, and so on down the chain.

Here's a simple visual example of a treasure hunt:

```
TREASURE HUNT! Start at the square marked "1" to find "the spot!"
—————————————————————
| |1| | | | | | | | | <-- First clue: "Go down two and right three."
—————————————————————
|3| | | | | | | | | | <-- Third clue: "Go down two and right seven."
—————————————————————
| | | | |2| | | | | | <-- Second clue: "Go up one and left four."
—————————————————————
| | | | | | | |x| | | <-- "x" marks the spot!
—————————————————————
```

Singly linked lists work the same way as this treasure hunt. The list *itself* must know the location of its first element, but nothing more. That's because the first *element* knows where the second element is, and so on down the chain.

The key insight about linked lists is that their contents (the elements) can be physically positioned any which way you like, much like the clues to a treasure hunt are often scattered far apart from one another. The elements don't all have to be next to each other, as though they were ducks in a row. Computers use this property of a linked list to store the list's data in whatever regions of memory they have available, which lets them make better use of limited available space.

This same property also makes it faster to perform certain operations on the list, such as adding elements ("inserting") to the start of the list. To understand why, imagine that we want to add a new clue to the beginning of a treasure hunt we made for a friend. Since the existing first clue already just points to the location of the second clue, all we have to do is write a new clue that points to the current location of the first clue. Then, instead of telling our friend where they can find the old first clue, we just tell them where they can find the new first clue. That new first clue points to the second, which already points to the third.

Singly linked lists are an important building block of more complex data structures, but they are somewhat limited on their own. Since the list itself only knows about its beginning, we can only find its end by reading all the items in the list. Think about the treasure hunt again: to find the treasure, your friend has to start at the clue you give them, and then follow each clue to the location of the next one. This also means it's not possible to go *backwards* through the list (to find the previous clue in the treasure hunt from your current clue).

Singly linked lists are often drawn as diagrams that may look something like this:

```
——————————     ——————————     ——————————
| Elem 1 | --> | Elem 2 | --> | Elem 3 |
——————————     ——————————     ——————————
```

These diagrams are incomplete at best because they don't show the list itself or clearly explain what the "links" (the arrows) are. They also don't show what the list is actually a list of. This is because the only idea that the notion of a "singly linked list" conveys is the way the list items themselves remember which is next. That said, a more complete and technically accurate diagram of a linked list that was, say, a music album's track listing, might look more like this:

```
——————————————————————————————————————————————————
|                Singly Linked List              |
|             First element: "Elem 1"            |
|                                                |
|    ——————————     ——————————     ——————————    |
|    | Elem 1 |     | Elem 2 |     | Elem 3 |    |
|    |        |     |        |     |        |    |
|    | Title: |     | Title: |     | Title: |    |
|    |-Opening|     | -Main  |     |-Ending |    |
|    |        |     |  Theme |     | Credits|    |
|    |        |     |        |     |        |    |
|    | Next:  |     | Next:  |     | Next:  |    |
|    | -Elem 2|     | -Elem 3|     | - NONE |    |
|    ——————————     ——————————     ——————————    |
|                                                |
——————————————————————————————————————————————————
```

Notice that the arrows are gone, and have been replaced by a label called "Next." In "Elem(ent) 1," the "Next" label references "Elem 2." That's how the first element "links" itself to the second. The second element does the same to link itself to the third, but the third element's "Next" label contains a special marker, indicating that it's the final element in the list.

Notice also that the elements contain a second label, called "Title" in this example. This is the actual "contents" of the item itself. The diagram above is intended to be an album's track listing, so the diagram actually represents how a computer might store a list like the following in its own memory:

```
1. Opening (then play track 2)
2. Main Theme (then play track 3)
3. Ending Credits (okay, stop playing)
```

Again, the important thing here is that the list items themselves note which one to read next, and *the point* of doing that is so I could physically write the items down out-of-order without changing the order in which I should play them back aloud, like this:

```
3. Ending Credits (okay, stop playing)
1. Opening (then play track 2)
2. Main Theme (then play track 3)
```

This may seem contrived to a human able to think abstractly, but is very useful to a computer that needs to read data from physical devices with limited space on them, such as hard drives, CDs, or memory chips (RAM). Being able to write the items down in whatever chunk of physical memory happens to be available, even if those chunks are far away from each other, and even if those chunks have other things already written on them, is a bit like writing the above track listing down on the same piece of paper that already has doodles on it, and that you kept last week's shopping list on. As long as there's enough space *somewhere* on the paper for each of the new items to fit individually, you can re-use the paper and still keep all the lists, doodles, and so on logically separated and contained.

## Further reading

* [Wikipedia](https://en.wikipedia.org/wiki/Linked_list)
