class Deck
  attr_reader :cards

  def initialize(size)
    @cards = (0..size-1).collect{|i| Card.new(Card::TYPES[i % 4])}
  end

  def shuffle
    @cards = cards.sort_by { rand }
  end

  def draw
    @cards.pop
  end
end