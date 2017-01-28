# Data Structures and Algorithms "for people without computer science degrees"

A compendium for self-education about "data structures and algorithms," created by and for "people without computer science degrees."

1. [Motivation](#motivation)
1. [How to use this repository](#how-to-use-this-repository)
  1. [Running the code](#running-the-code)
    * [JavaScript](#javascript)
    * [PHP](#php)
    * [Perl](#perl)
    * [Python](#python)
    * [Ruby](#ruby)
  1. [About code comments](#about-code-comments)
1. [Exercise suggestions](#exercise-suggestions)

## Motivation

Core computer science concepts, such as "data structures and algorithms," are taught using a classist, fucked-up pedagogical approach that makes me viscerally, incoherently angry. Nevertheless, I would like to know what the fuck people mean when they say things like "data structure" or "algorithm" and refer to specific structures or specific algorithms. Despite 20 years of practical programming experience, working in a variety of Information Technology sectors, I still feel completely lost when attempting to navigate this area of specialized knowledge.

THIS IS NOT A PERSONAL FAILURE. Moreover, there are *explicit and intentional* reasons that benefit mostly white men that explain the consistency and reliability for which education around computer science fails so many people like myself.

This repository exists, therefore, as a place for me to compile my own notes about this esoteric but critically important branch of the knowledge tree. It is my hope that it becomes useful, over time, to others who are feeling similarly despondent about the over-the-top doucheyness with which "CS courses" and "techies" talk about this area of their craft.

We understand that this doucheyness is a form of power-hoarding, i.e., gatekeeping. In the spirit of the original hacker ethos, "information should be free," we recognize this social gatekeeping behavior as a form of censorship and are determined to use the Internet to route around it.

TL;DR: Fuck your CS courses and your classist academia. We're going to learn this thing without your goddamn "help."

## How to use this repository

This is not a book. You don't have to read it "in order." In fact, I'm not even sure there's any particular order to read it in. I've also avoided any kind of "easier to harder" gradation, because these have not been useful to me when I've encountered them.

Instead, I encourage you to jump directly to the subsections that interest you. If you get frustrated, try a different section. Although you will certainly find yourself becoming more proficient the more you practice, each section is written to be accessible by novice coders with no prior exposure to the algorithm or data structure in question and assumes no prior knowledge of other algorithms or data structures.

### Running the code

I strongly encourage you to actually run and play around with the code itself. Do not merely read the source code, although do *also* read the source code. The source code files are *thoroughly* commented and are written with the intent of being educational. However, do absolutely download the files, or type them verbatim into your text editor, and execute them yourself.

Better yet, *debug* them yourself. This doesn't mean that there are bugs in the code. There aren't. (At least, I hope there aren't!) Instead, it means use your language's built-in debugging tools to inspect the code at each stage of its operation. This section will explain how to do that in more detail.

#### [JavaScript](https://en.wikipedia.org/wiki/JavaScript)

The JavaScript code samples are all compatible with [NodeJS](https://nodejs.org/) and all modern Web browser consoles because they conform to [ECMAScript 5](https://en.wikipedia.org/wiki/ECMAScript#5th_Edition). You can run them in a shell at a command line, or you can copy-and-paste them into the JavaScript console in your browser's developer tools.

To run them in a shell, execute them with `node` like this:

```sh
# to run the recursive implementation example of the trie data structure
node trie/trie_recursive.js
```

NodeJS has a built-in debugger, but the author finds it horrifically lacking and far prefers basically any browser's developer tools instead. That said, to debug the JavaScript code samples with the built-in NodeJS debugger, execute them like so:

```sh
node debug trie/trie_recursive.js
```

You can use the debugger to run one line of the code at a time, and it will allow you to inspect the values of all the variables during program execution. Once in the debugger, type `help` to get help. (The NodeJS debugger's help isn't very extensive, so feel free to hop into the [Better Angels's public chat room](https://gitter.im/betterangels/better-angels) if you need help from a human.)

Alternatively, open the `.html` file in your web browser (probably just by double-clicking it). The code will run automatically, though you may need to ensure your developer tools are open to see it. To learn more about your browser's developer tools, refer to your browser's documentation:

* [Google Chrome DevTools Overview](https://developers.google.com/web/tools/chrome-devtools/) provides everything you need to know about using the DevTools in Google Chrome, but for our purposes, focus on the following articles:
  * Using the [Google Chrome Console](https://developers.google.com/web/tools/chrome-devtools/console/)
  * [Inspect and Debug JavaScript: Set Breakpoints](https://developers.google.com/web/tools/chrome-devtools/javascript/add-breakpoints)
  * [Inspect and Debug JavaScript: Step Through Code](https://developers.google.com/web/tools/chrome-devtools/javascript/step-code)
* [Mozilla Firefox Developer Tools portal](https://developer.mozilla.org/en-US/docs/Tools) provides everything you need to know about using the Developer Tools in Mozilla Firefox, but for our purposes, focus on the following articles:
  * [Opening the Mozilla Firefox Web Console](https://developer.mozilla.org/en-US/docs/Tools/Web_Console/Opening_the_Web_Console)
  * [Opening the Firefox JavaScript Debugger](https://developer.mozilla.org/en-US/docs/Tools/Debugger/How_to/Open_the_debugger)
  * [Set a breakpoint - Firefox Developer Tools](https://developer.mozilla.org/en-US/docs/Tools/Debugger/How_to/Set_a_breakpoint)
  * [Step through code - Firefox Developer Tools](https://developer.mozilla.org/en-US/docs/Tools/Debugger/How_to/Set_a_breakpoint)

#### [PHP](https://php.net/)

The PHP code samples are all compatible with PHP 5.6 and newer. To run them, execute them like this at a command shell:

```sh
# to run the object-oriented implementation of the singly linked list data structure example
php singly_linked_list/singly_linked_list_object_oriented.php
```

PHP's standard debugger is called [`phpdbg`](http://phpdbg.com/). To debug the PHP code samples, execute them like so:

```sh
phpdbg singly_linked_list/singly_linked_list_object_oriented.php
```

You can use the debugger to run one line of code at a time, and it will allow you to inspect the values of all the variables during program execution. Once in the debugger, type `help` to get help. (The `phpdbg` help is verbose but not very intuitive, so feel free to hop into the [Better Angels's public chat room](https://gitter.im/betterangels/better-angels) if you need help from a human.)

#### [Perl](https://perl.org/)

The Perl code samples are all compatible with Perl 5.16 and newer. To run them, execute them like this at a command shell:

```sh
# to run the functional-style implementation of the stack data structure example
perl stack/stack_functional.pl
```

[Perl has a built-in debugger](http://perldoc.perl.org/perldebug.html#The-Perl-Debugger). To debug the code samples, execute them like so:

```sh
perl -d stack/stack_functional.pl # debug the functional stack example
```

You can use the debugger to run one line of the code at a time, and it will allow you to inspect the values of all the variables during program execution. Once in the debugger, type `h` to get help. (The Perl debugger's help is pretty thorough, but can be terse, so feel free to hop into the [Better Angels's public chat room](https://gitter.im/betterangels/better-angels) if you need help from a human.)

#### [Python](https://python.org/)

The Python code samples are all compatible with both [Python 2.7](https://docs.python.org/2.7/) and [Python 3](https://docs.python.org/3/) versions. To run them, execute them like this at a command shell:

```sh
# to run the iterative implementation of the binary search algorithm example
python binary_search/binary_search_iterative.py
```

Python's standard debugging module is called [`pdb`](https://docs.python.org/3/library/pdb.html). To debug the code samples, execute them like so:

```sh
python -m pdb binary_search/binary_search_iterative.py # debug the binary_search_iterative.py example
```

You can use the debugger to run one line of the code at a time, and it will allow you to inspect the values of all the variables during program execution. Once in the debugger, type `help` to get help. (The `pdb` help is pretty good, but feel free to hop into the [Better Angels's public chat room](https://gitter.im/betterangels/better-angels) if you need help from a human.)

#### [Ruby](https://www.ruby-lang.org/)

The Ruby code samples are all compatible with Ruby 2.0 and newer. To run them, execute them like this at a command shell:

```sh
# to run the imperative-style implementation of the selection sort algorithm example
ruby selection_sort/selection_sort_imperative.rb
```

Ruby's standard debugging library is called [`Debug`](http://ruby-doc.org/stdlib-2.0.0/libdoc/debug/rdoc/DEBUGGER__.html). To debug the Ruby code samples, execute them like so:

```sh
ruby -r debug selection_sort/selection_sort_imperative.rb
```

You can use the debugger to run one line of code at a time, and it will allow you to inspect the values of all the variables during program execution. Once in the debugger, type `help` to get help. (Ruby's debugger help is somewhat limited, so feel free to hop into the [Better Angels's public chat room](https://gitter.im/betterangels/better-angels) if you need help from a human.)

### About code comments

In addition to containing detailed inline code comments, each example is also formally documented using the best practices of the language in which the example code is written. Formal documentation means that the files, classes, class members, methods, functions, arguments of each function, and other relevant implementation details are accessible by tools that automatically generate a programmer's manual for how to use the class, method, or function implemented by the example. Each language has its own de-facto standard tool for this:

* [JSDoc](http://usejsdoc.org/) is used for documenting the JavaScript code samples.
* [PHPDoc](https://phpdoc.org/) is used for documenting the PHP code samples.
* [Plain Old Documentation (POD)](http://perldoc.perl.org/perlpod.html) format is used for documenting the Perl code samples.
* [Google-style Python docstrings](https://google.github.io/styleguide/pyguide.html?showone=Comments#Comments) are used for documenting the Python code samples. Additionally, the Python code samples embed [`doctest`s](https://en.wikipedia.org/wiki/Doctest) to show example usage and output.
* [RDoc](http://rdoc.sourceforge.net/doc/index.html) is used for documenting the Ruby code samples.

I've done this in order to habitualize novice programmers to reading (and hopefully writing) such auto-generatable documentation. Since each code sample is self-contained and relatively small, this also provides a good opportunity to practice installing, using, and tweaking the formatting or output of such automatic code documentation tools, if you want to do that. (I recommend it.)

## Exercise suggestions

In addition to running the code samples, I suggest you try one or more of the following exercises with each sample. It's more fun if you can find a friend to do them with. This is called "pair programming" (or just "pairing" for short), and it works a little bit like the way a pilot and co-pilot collaborate when flying a plane: one person has their hands on the keyboard (the "driver") and the other person suggests things to try (the "navigator"). Switch up who's driving and who's navigating as often as you feel comfortable, but try to make sure one of you isn't monopolizing one role or the other. (You might be surprised how much you can learn from navigating rather than driving, or vice versa, if you're not used to it.)

* Re-implement one of the algorithms or construct one of the data structures using a different programming language than the ones in the repository. For instance, if you know Ruby but only see a Python code sample, rewrite the code so it does the same thing in Ruby.
* Re-implement the same algorithm using a different programming style. For instance, if you see a code sample implementing an algorithm recursively, implement an iterative variant, or vice versa.
