require_relative "card.rb"
require "byebug"

class Hand
  attr_accessor :cards

  def initialize(cards = [])
    @cards = cards.sort_by {|card| card.value}
  end

  def discard(array)
    cards.reject!.with_index {|card,idx| array.take(3).include?(idx)}
  end

  def self.straight?(values)
    return true if values == [10, 11, 12, 13, 1]

    (0..3).each do |idx|
      return false unless values[idx]+1 == values[idx+1]
    end

    true
  end

  def self.flush?(suits)
    suits.uniq.length == 1
  end

  def self.four?(values)
    count_arr = [values.count(values.first), values.count(values.last)]

    count_arr.include?(4)
  end

  def self.full_house?(values)
    
  end



  private

  def my_values
    value_arr = []
    cards.each {|card| value_arr << card.value}
    value_arr
  end

  def my_suits
    suit_arr = []
    cards.each {|card| suit_arr << card.suit}
    suit_arr
  end
end
