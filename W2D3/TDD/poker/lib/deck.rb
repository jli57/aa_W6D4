require_relative "card.rb"

class Deck
  VALUES = (1..13).to_a
  SUITS = [:d, :c, :h, :s]

  attr_accessor :stack

  def self.random_deck
    stack = []
    VALUES.each do |value|
      SUITS.each do |suit|
        stack << Card.new(value, suit)
      end
    end

    stack.shuffle
  end

  def initialize(stack = Deck.random_deck)
    raise(ArgumentError) unless stack.is_a?(Array)

    # raise("Stacked deck error") unless Deck.uniq?(stack)

    @stack = stack
  end

#   private
#   def self.uniq?(stack)
#     cards_arr = []
#     stack.each do |card|
#       return false if cards_arr.any? do |checked_card|
#         card.value == checked_card.value && card.suit == checked_card.suit
#       end
#     end
#     true
#   end
# end
