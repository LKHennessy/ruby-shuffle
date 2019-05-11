require 'rainbow'
require 'chroma'

class Deck
  attr_reader :deck

  SEED = Chroma.paint 'hsl(0, 100%, 50%)'
  CARD = ' '

  Chroma.define_palette :rainbow_52_palette do
    51.times do |n|
      spin((n + 1) * 6.7)
    end
  end

  def initialize
    @deck = SEED.palette.rainbow_52_palette.map(&:to_hex).map do |colour|
      Rainbow(CARD).background(colour)
    end
  end

  def print_horizontal(cards)
    string = ''
    cards.each do |card|
      string = string + card
    end
    puts string
  end

  def print_deck
    print_horizontal(@deck)
  end

  def split_deck
    puts '-----------------Splitting the deck-----------------'

    left_half, right_half = deck.each_slice(26).to_a

    print_horizontal(left_half)
    print_horizontal(right_half)

    @deck = [left_half, right_half]
  end

  def intersperse_deck
    puts '-----------------Interspersing the deck-----------------'

    @deck = shuffled_deck = @deck.transpose.flatten

    print_horizontal(shuffled_deck)
  end

  def riffle_shuffle
    puts '-----------------RIFFLE SHUFFLE-----------------'

    print_deck

    split_deck

    intersperse_deck
  end
end