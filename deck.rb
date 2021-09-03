require_relative "card"

class Deck
  attr_reader :cards

  def initialize
    @cards = []

    marks = %w(♤ ♡ ♢ ♧)
    numbers = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
    marks.each do |mark|
      numbers.each do |number|
        card = Card.new(mark, number)
        @cards << card
      end
    end
    @cards.shuffle!
  end
end
