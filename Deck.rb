require 'rainbow'
require 'chroma'
require './palette.rb'

class Deck
  attr_reader :deck

  SEED = Chroma.paint 'hsl(0, 100%, 50%)'
  CARD = ' '

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

  def print
    print_horizontal(@deck)
  end

  def split_at(card_number: 26)
    puts '-----------------Splitting the deck-----------------'

    middle_length = 52 - 2 * card_number

    if [true, false].sample
      left_half = @deck.slice!(0..(card_number - 1 + middle_length))
      right_half = @deck
    else
      left_half = @deck.slice!(0..card_number - 1)
      right_half = @deck
    end

    print_horizontal(left_half)
    print_horizontal(right_half)

    @deck = [left_half, right_half]
  end

  def intersperse(pure: true)
    puts '-----------------Interspersing the deck-----------------'

    @deck = @deck.shuffle

    unless pure
      first_half, last_half = @deck
      if first_half.length > last_half.length
        difference = first_half.length - last_half.length
        difference.times do
          last_half = last_half.insert(rand(0..last_half.length), nil)
        end
      else
        difference = last_half.length - first_half.length
        difference.times do
          first_half = first_half.insert(rand(0..first_half.length), nil)
        end
      end
    end

    @deck = @deck.first.zip(@deck.last).flatten.compact

    print
  end

  def ruby_shuffle
    puts '-----------------RUBY SHUFFLE-----------------'

    print

    puts '-----------------Shuffling-----------------'

    @deck = @deck.shuffle

    print
  end

  def precise_riffle_shuffle
    puts '-----------------PRECISE RIFFLE SHUFFLE-----------------'

    print

    split_at

    intersperse
  end

  def imprecise_riffle_shuffle
    puts '-----------------IMPRECISE RIFFLE SHUFFLE-----------------'

    print

    split_at(card_number: rand(23..26))

    intersperse(pure: false)
  end

  def simple_overhand_shuffle
    puts '-----------------SIMPLE OVERHAND SHUFFLE-----------------'

    print

    take_for_overhand

    do_the_shuffle
  end

  def take_for_overhand
    puts '-----------------Splitting the deck-----------------'

    left_hand = @deck.slice!(0..4)
    right_hand = @deck

    print_horizontal(left_hand)
    print_horizontal(right_hand)

    @deck = [left_hand, right_hand]
  end

  def do_the_shuffle
    puts '-----------------Do the shuffle-----------------'

    left_hand, right_hand = @deck

    while !right_hand.empty?
      thing = right_hand.shift(rand(1..5))
      left_hand = thing + left_hand
    end

    @deck = left_hand

    print
  end
end