require "rspec"
require "card.rb"

RSpec.describe Card do
  subject(:new_card) {Card.new}
  let(:test_card1) {Card.new(1, 'd')}
  let(:test_card2) {Card.new(2, 's')}

  describe "#initialize" do
    it "initializes without a suit or value" do
      expect(new_card.value).to be(nil)
      expect(new_card.suit).to be (nil)

    end
  end

  describe "#==" do
    it "raises an error unless other card is a Card" do
      expect{ test_card1 == "Horse" }.to raise_error(ArgumentError)
    end

    it "returns false if cards are different" do
      expect(test_card1 == test_card2).to be false
    end

    it "returns true if cards are same" do
      expect(test_card1 == test_card1).to be true
    end
  end


end
