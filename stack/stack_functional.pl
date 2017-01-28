#
# Stack data structure, functional implementation.
#
use strict;
use warnings;

=pod

=head1 Name

C<stack_functional.pl> - Example of a stack implementation in
functional programming style.

=head1 Description

A stack is nothing more than a set of items that can be accessed in
only one very specific way. Specifically, the last item added to the
stack is the only one that can be immediatelly accessed. This is just
like stacking books one atop the other; to open the book on bottom of
the stack, you must first move all the books above it out of the way.

Since a stack is such a basic data structure, most programming
languages have built-in variable types that can be treated as though
the variable were a stack. In Perl, these include arrays and hashes.
The thing that makes a stack "a stack" is just the fact that you will
always restrict yourself to working with the last item added before
any other items in the stack.

Most languages also have built-in functions to do this for you, but
we're going to (mostly) ignore that fact for the sake of our own
education. Instead, we'll use one such variable type (a Perl array)
and write our own functions to make use of it like it is a stack.

=head1 Functions

One of the important things we need to be able to do with a stack is
to add items to it. The other important thing is to remove that item.
These operations will be implemented as two separate functions (or
"subroutines" in Perl lingo).

=over

=item add_to_stack()

Adds an item to a given array and returns a copy of the array:

    @new_array = add_to_stack(@old_array, 'Item');

Programmers call this operation a "push," and most programming
languages have a built-in C<push()> function..

=cut

sub add_to_stack {
    # Copy all arguments over to a local variable.
    my @args = @_;

    # Simply return them all, since what we were given was an array
    # and then the argument to add to it. :)
    return @args;
}

=pod

=item remove_top_item_from_stack()

Given an array, returns a reference to a new array without the last
item in it, and the last item itself.

    ($item, $array_reference) = remove_top_item_from_stack(@stack);

Programmers call this operation a "pop," and most programming
languages have a built-in C<pop()> function.

=back

=cut

sub remove_top_item_from_stack {
    my @args = @_;

    # Get the very last argument passed to this function. That is the
    # "top" of our stack.
    my $top_item = $args[-1];

    # Get a copy of all the arguments passed to this function except
    # the very last one. This is our new stack.
    my @shortened_stack = splice @args, 0, -1; # `splice` is built-in

    return ($top_item, \@shortened_stack); # Return a reference!
}

# First, make an empty array, which will be where we stack some books.
my @stack_of_books = ();

# Now we add a book to it.
my @bigger_stack = add_to_stack(@stack_of_books, 'The Giver');

# Let's stack a few more books on top of the last one.
@bigger_stack = add_to_stack(@bigger_stack, q(Harry Potter and the Sorcerer's Stone));
@bigger_stack = add_to_stack(@bigger_stack, 'Jurassic Park');
@bigger_stack = add_to_stack(@bigger_stack, 'Lord of the Rings: The Fellowship of the Ring');

# Now we only remove the top book, one at a time.
my ($book, $stack) = remove_top_item_from_stack(@bigger_stack);
print "The top book is: $book\n";

($book, $stack) = remove_top_item_from_stack(@{$stack}); # De-reference the array.
print "The next book is: $book\n";

1; # Return success.

__END__

=pod

=head1 Author

Meitar "maymay" Moscovitz <meitarm+github@gmail.com>

=cut
