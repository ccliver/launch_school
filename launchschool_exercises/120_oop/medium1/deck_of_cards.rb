class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def <=>(other)
    rank_values = {
      1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5,
      6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10,
      'Jack' => 11, 'Queen' => 12,
      'King' => 13, 'Ace' => 14 }
    rank_values[self.rank] <=> rank_values[other.rank]
  end

  def ==(other)
    self.to_s == other.to_s
  end
end

class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @cards = []
  end

  def draw
    shuffle_deck if @cards.empty?
    @cards.pop
  end
  
  def shuffle_deck
    RANKS.each do |rank|
      SUITS.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
    @cards.shuffle!
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.
