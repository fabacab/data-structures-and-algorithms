# Singly linked list

A singly linked list is a data structure made of a sequence of items, or elements, each of which points to the next element in the sequence. The last element in the list is the only exception to this rule, since it cannot point to a next element by virtue of being the last one. The name "linked list" can be confusing because there is no literal "linking" going on; the elements are not joined together in any physical way. Instead, the name "linked" refers merely to a given element's own knowledge of where the next element is.

One good example of a singly linked list you might already be familiar with is a treasure hunt. Each clue in a treasure hunt points you toward the next clue, which in turn points you to the next one, until finally you reach the treasure at the end. The treasure hunt is like the list itself, as it is made up of a sequence of clues. The clues are like the individual elements in the list. To start the treasure hunt, you need to know the location of the first clue. That first clue itself knows the location of the second clue, and so on down the chain.

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

The key insight about singly linked lists is that their contents (the elements) can be physically positioned any which way you like, much like the clues to a treasure hunt are often scattered far apart from one another. The elements don't all have to be next to each other, as though they were ducks in a row. This is possible specifically because the information about which item is next in the chain is stored as part of the previous element.

This same property also makes it possible to add elements ("inserting") to the start of the list extremely quickly. To understand why, imagine that we want to add a new clue to the beginning of a treasure hunt we made for a friend. Since the existing first clue already just points to the location of the second clue, all we have to do is write a new clue that points to the current location of the first clue. Then, instead of telling our friend where they can find the old first clue, we just tell them where they can find the new first clue. That new first clue points to the second, which already points to the third.

Singly linked lists are an important building block of more complex data structures, but they are somewhat limited on their own. Since the list itself only knows about its beginning, we can only find its end by reading all the items in the list. Think about the treasure hunt again: to find the treasure, your friend has to start at the clue you give them, and then follow each clue to the location of the next one.

This also means it's not possible to go *backwards* through the list (to find the previous clue in the treasure hunt from your current clue).

## Further reading

* [Wikipedia](https://en.wikipedia.org/wiki/Linked_list)
