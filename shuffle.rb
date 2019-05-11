require 'rainbow'
require 'chroma'

class Shuffle
  SEED = Chroma.paint 'hsl(0, 100%, 50%)'
  CARD = ' '

  Chroma.define_palette :rainbow_52_palette do
    51.times do |n|
      spin((n + 1) * 6.7)
    end
  end

  def self.print_horizontal(cards)
    string = ''
    cards.each do |card|
      string = string + card
    end
    puts string
  end

  rainbow = SEED.palette.rainbow_52_palette.map(&:to_hex)

  puts '-----------------RIFFLE SHUFFLE-----------------'

  deck = rainbow.map do |colour|
    Rainbow(CARD).background(colour)
  end

  self.print_horizontal(deck)

  puts '-----------------Split the deck-----------------'

  left_half, right_half = deck.each_slice(26).to_a

  self.print_horizontal(left_half)
  self.print_horizontal(right_half)

  puts '-----------------Intersperse-----------------'

  shuffled_deck = [left_half, right_half].transpose.flatten

  self.print_horizontal(shuffled_deck)
end