#
# Selection sort algorithm, imperative implementation.
#
# The selection sort algorithm is a simple technique that takes a set
# of unordered items and orders them according to some characteristic
# that can be compared against each other item. Common examples of
# sort order are "highest to lowest" or "alphabetically."
#
# Author:: Meitar "maymay" Moscovitz <meitarm+github@gmail.com>
# License:: GPL-3.0
#
# :main:selection_sort_imperative.rb
#

# Alphabetizes the given +items+ using selection sort. The +items+ are
# deleted, and the newly ordered items are returned in a copied array.
def alphabetize_using_selection_sort (items)

  # Make a new array to hold the ordered data as we select them.
  ordered_items = Array.new

  # As we select items, we'll be removing those items from the
  # original input. When we have no more items in our original input,
  # we can assume we have successfully ordered them so we'll be done.
  while items.length > 0

    # We have to remember which item in the data we've selected, so we
    # start by "selecting" the item in the first position.
    selection = 0

    # For each of the items we still need to order,
    items.each do |item|

      # check if that item is "less than" (alphabetically earlier)
      # than the item we've currently "selected"
      if item < items[selection]
        # and if it is, remember that item's position.
        selection = items.find_index(item)
      end

    end

    # Once we've read through all the items, we have the position of
    # the item that meets the criteria we want, so we can put that
    # item at the end of our new array,
    ordered_items.push(items[selection])
    # and remove that item from the original data.
    items.delete_at(selection)

  end

  # Now we have a new, ordered array. :)
  return ordered_items

end

print 'Enter a few words to alphabetize: '
words = gets.chomp.split(' ')
puts alphabetize_using_selection_sort(words)
