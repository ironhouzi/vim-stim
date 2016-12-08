vim-stim
=======

StIm - Star Improved

## Usage

* StIm aims to improve the built in star-command with two adjustments:

    1. Highlight word, but don't jump to the next match on the initial issuing of a star-command.

    2. All consecutive spamming of * will jump to the next match.

* The state will be reset by either of the following events occurs:

    1. User disables hlsearch.

    2. The word under the cursor is different from the previous use of star-command.

## Why use the StIm plugin?

* Vim users who don't like to have hlsearch activated by default and use
incsearch instead, often do so because they are constantly searching
to perform arbitrary jumps, or using searches as text-objects. Having
hlsearch activated will in these cases clutter the buffer for each minor
jump or modification. Vim users who still want to have highlighted
searches can do so by using this plugin.

* The behavior of not jumping on the first press was found in Steve Losh's
vimrc, but the added functionality of spamming * to jump to the next match
was an itch that this plugin aims to scratch.

* StIm is extremely light, with just ~30 lines of code.
