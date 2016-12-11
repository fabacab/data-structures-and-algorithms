/**
 * Trie data strcuture
 *
 * A trie (pronounced "try," shortened name from the word "reTRIEval")
 * is a kind of "tree" data structure useful for quickly retrieving
 * a result based on a given starting input (the prefix).
 * 
 * For example, when you start typing into a search box and are shown
 * auto-completed search suggestions almost instantly, there's likely
 * a trie somewhere under the hood.
 *
 * @author Meitar "maymay" Moscovitz <meitarm+github@gmail.com>
 *
 * @see {@link https://en.wikipedia.org/wiki/Trie}
 */

// Store these words in a trie.
const words = ['cat', 'caper', 'dark', 'dapper'];

// The trie object itself.
const trie = {}; // It begins empty, since there's no data in the trie.

// Each word needs to be added to the trie.
words.forEach(word => {

  addToTrie(word, trie);

});

/**
 * Takes a string and adds it to the given trie.
 *
 * Strings are not added to tries as their original string.
 * Instead, they are broken into their constituent characters
 * and each character is added to the trie as part of the trie's
 * tree structure.
 * 
 * For instance, for the English language, where the only valid
 * starting characters are the letters "A" through "Z", our trie
 * will have at most 26 "root" nodes:
 * 
 *  {
 *      'a': { … },
 *      // 'b', 'c', and so on…
 *      'z': { … }
 *  }
 * 
 * Given the word `cake`, we would have a structure like this:
 * 
 * {
 *    'c': {
 *      'a': {
 *        'k': {
 *          'e': {
 *            …
 *          }
 *        }
 *      }
 *    }
 * }
 * 
 * Notice that the first level is only the letter "c" and not
 * the whole string "cake." This means that when we add another
 * word that begins with the same letter, we can add it to the
 * sublevel of "c" instead of storing it in its entirety:
 * 
 * {
 *    'c': {
 *      'a': {
 *        'k': {
 *          'e': {
 *            …
 *          }
 *        }
 *      },
 *      'u': {
 *        't': {
 *          'e': {
 *            …
 *          }
 *        }
 *      }
 *    }
 * }
 * 
 * The above trie contains the words "cake" and "cute." Since
 * both words begin with the letter "c," there is only one "c"
 * object inside the trie. If we then add the word "cat" to the
 * above trie, our object should look like this:
 * 
 * {
 *    'c': {
 *      'a': {
 *        'k': {
 *          'e': {
 *            …
 *          }
 *        },
 *        't': {
 *           …
 *        }
 *      },
 *      'u': {
 *        't': {
 *          'e': {
 *            …
 *          }
 *        }
 *      }
 *    }
 * }
 * 
 * Notice that when we added the word "cat" we only had to add
 * the one letter that was not already the same as any other
 * word's prefix. In this case, that was simply the letter "t."
 *
 * @param {string} string
 * @param {Object} trie
 */
function addToTrie(string, trie) {
    // Get the first letter of our string.
    const letter = string[0];

    // Check to see if the first letter is in our trie.
    if (!trie[letter]) {
        // If it's not, we need to add a node to our trie, and call
        // that node by the letter we've just checked. That "letter"
        // is now an object in our data structure.
        trie[letter] = {};

    }

    // Next we need to move on to the "rest" of the string.
    // That is, we no longer care about the first letter because
    // we've already determined that letter ("prefix") exists in
    // our trie structure, so we've stored it alreddy.
    string = string.substr(1);

    // Since we have to do the above for each letter in the string
    // that we're adding to the trie, we can just call this same
    // function again and again (i.e., we can call it recursively).
    // This time, though, we're one-level deep.
    if (string) { // But only *actually* recurse if we have data left.
        addToTrie(string, trie[letter]);
    }

    // When we're no longer recursing, we return the trie we made.
    return trie;
}

console.log(JSON.stringify(trie, null, 2));
