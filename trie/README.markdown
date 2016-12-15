# Trie

A trie (pronounced "try") is a nested data structure useful for quickly retrieving (hence the name, as it's used for re*trie*val) a result based on a given starting input (called the *prefix*). You probably use tries every day without thinking much about it. For example, when you start typing into a search box and are immediately shown [auto-completed search suggestions](https://support.google.com/websearch/answer/106230?hl=en "Google Search Help: Search using autocomplete"), it's likely that the app you're using has made a trie of all prior search queries it's been asked before!

A word or phrase is not added to a trie as a single, complete entry. Instead, the word or phrase is first broken up into its individual characters. The word "cake" would be stored as a set of four separate items: the letters `c`, `a`, `k`, and `e`. The magic is in choosing where in the trie to insert each character.

If we only have one word in our trie, such as the word `cake`, we would have a structure that might look like this in JavaScript:

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

As you can see, we have a containing object (the outermost braces), which is our trie itself. Inside that, we have a `c`, and inside that `c` we have an `a`, and so on. One character is nested "inside" the preceding character until we reach the end of the word (at `e`, in this case).

The important thing to notice is that the first level is only the letter "c" and not the whole word "cake." This means that when we add another word that *begins with the same letter* (it has the "same prefix"), we can add it to the trie by repurposing the outermost `c` character and only adding characters in places where the prefix is different. For instance, if we add the word "cute" to our trie, our JavaScript representation might now look like this:

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

The above trie contains both the words "cake" and the word "cute." However, since both words start with the letter "c," there is only one `c` inside the trie; `c` is the common prefix for both `cake` and `cute`. If we then add the word "cat" to the above trie, our JavaScript object should look like this:

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

This time, notice that when we added the word "cat" we only had to add the one letter that was not already the same as any other prefix. In this case, that was simply the letter `t`, because `cat` shares a common two-character prefix with `cake`, which we already added in our trie when we first added the word "cake" to it.

How might this structure make tasks such as "check if we have seen the word `cake` before" much faster and easier to accomplish? Well, rather than having to check to see if we have the word "cake" in our (possibly very long) list of words, we simply have to check if we have any words that begin with `c`, and if we do, if that `c` "contains" an `a`, and if so, whether that `a` contains a `k`, and so on. If at any point we do *not* have the next character of our lookup word, we simply stop looking because it's certainly not possible to have the word "cake" in our trie if we've never seen any given *prefix* of the word itself! That is, we can't possibly have the word "cake" in our list of words if we've never seen a word that begins with `ca`. (And we can't possibly have `cat` in our list then, either.)

Here's another example of a trie, this time with four words in it:

```js
{
    "c": {
        "a": {
            "t": {},
            "p": {
                "e": {
                    "r": {}
                }
            }
        }
    },
    "d": {
        "a": {
            "r": {
                "k": {}
            },
            "p": {
                "p": {
                    "e": {
                        "r": {}
                    }
                }
            }
        }
    }
}
```

## Further reading

* [Wikipedia](https://en.wikipedia.org/wiki/Trie)
