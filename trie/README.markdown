# Trie

A trie (pronounced "try," shortened name from the word "reTRIEval")
is a kind of "tree" data structure useful for quickly retrieving
a result based on a given starting input (the prefix).

For example, when you start typing into a search box and are shown
auto-completed search suggestions almost instantly, there's likely
a trie somewhere under the hood.

Strings (words, phrases, etc.) are not added to tries as their original string.
Instead, they are broken into their constituent characters
and each character is added to the trie as part of the trie's
tree structure.
 
For instance, for the English language, where the only valid
starting characters are the letters "A" through "Z", our trie
will have at most 26 "root" nodes. In JavaScript, that might be represented like this:

```js
{
    'a': { /* ...some data in here... */ },
    // same for 'b', 'c', and so on...
    'z': { /* ...some data in here... */ }
}
```

Given the word `cake`, we would have a structure like this:

```js
{
    'c': {
        'a': {
            'k': {
                'e': {
                    // and we're done, so this object is empty!
                }
            }
        }
    }
}
```

Notice that the first level is only the letter "c" and not
the whole string "cake." This means that when we add another
word that begins with the same letter, we can add it to the
sublevel of "c" instead of storing it in its entirety:

```js
{
    'c': {
        'a': {
            'k': {
                'e': {
                    // this object has spelled "cake"
                }
            }
        },
        'u': {
            't': {
                'e': {
                    // and this one has spelled "cute"
                    // but we used the same "c" from the beginning!
                }
            }
        }
    }
}
```
 
The above trie contains the words "cake" and "cute." Since
both words begin with the letter "c," there is only one "c"
object inside the trie. If we then add the word "cat" to the
above trie, our object should look like this:

```js
{
    'c': {
        'a': {
            'k': {
                'e': {
                    // "cake" again
                }
            },
            't': {
                // "cat", sharing the "ca" prefix with "cake"
            }
        },
        'u': {
            't': {
                'e': {
                    // "cute", sharing only the first letter, "c"
                }
            }
        }
    }
}
```

Notice that when we added the word "cat" we only had to add
the one letter that was not already the same as any other
word's prefix. In this case, that was simply the letter "t."

## Further reading

* [Wikipedia](https://en.wikipedia.org/wiki/Trie)
