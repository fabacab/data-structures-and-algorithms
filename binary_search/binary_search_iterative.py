"""
Binary search algorithm, iterative implementation.

A binary search is a method to quickly find a given item in a sorted
list. It's important the input list is sorted, or the binary search
algorithm won't be useful at all. Sorted lists are things like
alphabets (because "A" is always before "B," and so on), or number
lines (because "1" is always before "2," and so on).
"""

from math import floor # We're gonna need to round down.

def binary_search_iterative(stuff, item):
    """
    Return the index of ``item`` in ``list`` using binary search.

    Args:
        stuff (list): A Python list that has already been sorted.
        item: The value of the item to search for (not its index).

    Returns:
        The index of ``item`` or ``None`` if ``item`` is not found.

    >>> binary_search_iterative([1, 2, 3, 4, 5, 6, 7, 8], 8)
    Guess number 1 is 4
    Guess number 2 is 6
    Guess number 3 is 7
    Guess number 4 is 8
    7

    Notice that the final return value is 7, not 8, because Python
    list indexes start counting from position number 0, not number 1.
    """

    # We will be keeping track of a range of positions instead of
    # looking at position 0 and then looking at position 1, so we need
    # to keep track of the lowest and highest positions of that range,
    # not just the current spot in the list of stuff we're looking at.

    # The low position always starts at 0.
    low = 0

    # The high position is however much stuff we're looking through.
    high = len(stuff) - 1 

    # We also keep track of how many guesses we're making to find it.
    guess_number = 0 # (This is just for our own edification.)

    # Eventually, `low` and `high` will converge, because we'll keep
    # shrinking the range by half (hence, "*binary* search") until we
    # find the item we're looking for. After each guess, we'll loop
    # (that is, we'll iterate) over the same list in a narrower range.
    while low <= high:
        # The middle spot of our range is always going to be the
        # current value of low plus high, divided by two.
        mid = int(floor((low + high) / 2)) # round down, just in case.

        guess = stuff[mid] # That middle spot will be our next guess,
        guess_number = guess_number + 1 # so let's count our guesses.

        # How many guesses have we made so far?
        print("Guess number " + str(guess_number) + " is " + str(guess))

        if guess == item: # If this is the correct guess,
            return mid    # then we've found the item! Yay! :)

        # If we haven't found the item yet, then our guess was either
        # too low or too high. Thankfully, our list of stuff is sorted
        # so, if the guess was too high
        if guess > item:
            # then we know the item we're looking for is in the lower
            # half of our range. This means we can set the high end of
            # our range to the middle position of our last guess. We
            # also subtract 1 since we know our last guess was wrong.
            high = mid - 1
        else:
            # On the other hand, if the guess was too low, then we
            # know the item is in the higher half of our range, so we
            # set the low end of our range to the middle position of
            # our last guess, instead.
            low = mid + 1

    # If we still haven't found the item, then it's not in the list!
    return None

if __name__ == "__main__":
    num = int(input('Enter a number between 1 and 100: '))
    binary_search_iterative(range(1, 101), num)
