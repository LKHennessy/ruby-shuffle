require 'rainbow'
require 'chroma'

SEED = Chroma.paint 'hsl(0, 100%, 50%)'
CARD = '[]'

Chroma.define_palette :rainbow_52_palette do
  51.times do |n|
    spin((n + 1) * 6)
  end
end

rainbow = SEED.palette.rainbow_52_palette.map(&:to_hex)

rainbow.each do |colour|
  puts Rainbow(CARD).color(colour)
end

puts '-----------------RIFFLE SHUFFLE-----------------'

puts '-----------------Split the deck-----------------'

left_half, right_half = rainbow.each_slice(26).to_a

left_half.each_with_index do |colour, i|
  puts "#{Rainbow(CARD).color(colour)}  #{Rainbow(CARD).color(right_half[i])}"
end

puts '-----------------Intersperse-----------------'

shuffled_deck = [left_half, right_half].transpose.flatten

shuffled_deck.each do |colour|
  puts Rainbow(CARD).color(colour)
end