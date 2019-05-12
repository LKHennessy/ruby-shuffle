require 'chroma'

class Palette
  Chroma.define_palette :rainbow_52_palette do
    51.times do |n|
      spin((n + 1) * 6.7)
    end
  end
end