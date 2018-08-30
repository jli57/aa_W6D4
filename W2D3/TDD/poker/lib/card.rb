class Card

  attr_reader :value, :suit

  def initialize(value=nil, suit=nil)
    @value = value
    @suit = suit
  end

  def ==(other_card)
    raise(ArgumentError) unless other_card.is_a?(Card)

    self.value == other_card.value && self.suit == other_card.suit
  end
end
