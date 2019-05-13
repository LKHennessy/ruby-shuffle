# Ruby Shuffle

A card shuffling visualisation tool.

## Installation

* Clone the repo
* `bundle install`

## Usage

### Getting Started

* Run `irb --simple-prompt --noecho`; irb, but with simple prompt and no echo to
 reduce terminal noise (until I build a CLI!)
* `require './deck.rb'`

### Deck creation

Create a 52 card rainbow deck with `deck = Deck.new`

### Shuffles

Shuffles are recreations and visualisations of different forms of human card
 shuffling methods.
 Each shuffle will print the deck, or portions of the deck,
 at appropriate intervals during the shuffling process.
 Each shuffle also prints the
 state of the deck after the shuffle is complete.

All kinds of shuffles, except `ruby_shuffle`, take an optional `times` argument,
to perform the shuffle x number of times. eg:
`deck.simple_riffle_shuffle(times: x)`. The default is 1 for all shuffles.

#### Precise Riffle Shuffle

`deck.precise_riffle_shuffle`

A precise riffle shuffle is where the deck is split evenly in half
 and the haves are interspersed, or zipped together.
 The only random element in this shuffle is which order the halves are in
 for interspersing.
 Either the first card in the deck remains the first card in the deck,
 or it becomes the second card in the deck.
 Without this element of randomness, the precise riffle shuffle actually
 reorders a deck in exactly 8 shuffles!

#### Imprecise Riffle Shuffle

`deck.imprecise_riffle_shuffle`

An imprecise riffle shuffle is where the deck is split roughly in half
 and the haves are interspersed, or zipped together.
 The 'halves' can range from 23 to 29 cards for each shuffle.
 The order the halves are in for interspersing is random.
 The distribution of the extra cards from the larger half,
 throughout the smaller half, is random.

#### Simple Overhand Shuffle

`deck.simple_overhand_shuffle`

A simple overhand shuffle is where the majority of cards are separated
from the bottom of the deck,
leaving 1 to 3 cards from the top of the deck.
The top 1 to 5 cards from the separated cards are placed on top of the deck
repeatedly until the full deck is reformed.

#### Complex Overhand Shuffle

`deck.complex_overhand_shuffle`

A complex overhand shuffle is where the majority of cards are separated
from the middle of the deck,
leaving 1 to 3 cards from the top of the deck
and 1 to 3 cards from the bottom of the deck.
The top and bottom 1 to 5 cards from the separated cards are placed on top of
the deck repeatedly until the full deck is reformed.

#### Ruby Shuffle

`deck.ruby_shuffle`

A ruby shuffle is just what it sounds like, calling the Ruby array method
 `.shuffle` on the deck.
 This is the only method which does not take an optional times argument.

### Extras
* Print a graphical representation of your current deck using `deck.print`
* Print a visual comparison of your current deck with a fresh deck using
`deck.compare_with_new`
* The components of shuffle procedures are public methods.
You *can* call them on any instance of Deck,
but they might behave oddly when called in isolation.

### Contributing
This is a small personal project to explore the patterns and efficiency
of different card shuffling options. PRs with bug fixes are welcome,
as are issues. As far as implementing more types of shuffles,
I would rather do that work myself or not at all!

Feel free to fork though, and do whatever you like with the code that's here!