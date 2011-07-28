module SpaceTruckin
  class Deck
    attr_reader :cards

    def initialize(size)
      @cards = (0..size-1).map{|i| Card.new(Card::TYPES[i % 4])}
    end

    def shuffle
      @cards = @cards.shuffle
    end

    def draw
      @cards.shift
    end

    def return_card(card)
      @cards << card
      shuffle
    end

    def empty?
      @cards.empty?
    end
  end
end