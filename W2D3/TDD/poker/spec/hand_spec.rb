require "rspec"
require "hand.rb"

RSpec.describe Hand do
  subject(:testhand) {Hand.new}

  describe "#initalize" do
    it "starts with an empty hand" do
      expect(testhand.cards).to be_empty
    end

    it "can never have more than 5 cards" do
      expect(testhand.cards.length).to be <= 5
    end

  end

  describe "#discard" do

    let(:fullhand) {Hand.new(Array.new(5,Card.new))}

    it "discards cards properly" do
      fullhand.discard([0,1])
      expect(fullhand.cards.length).to eq(3)
    end

    it "ignores indices after the 3rd" do
      fullhand.discard([0,1,2,3])
      expect(fullhand.cards.length).to eq(2)
    end
  end

  describe "#straight?" do
    it "returns false for not a straight" do
      expect(Hand.straight?([1, 1, 3, 4, 5])).to be false
    end

    it "returns true for a regular straight" do
      expect(Hand.straight?([2, 3, 4, 5, 6])).to be true
    end

    it "returns true for A-High straight" do
      expect(Hand.straight?([10, 11, 12, 13, 1])).to be true
    end
  end

  describe "#flush?" do
    it "returns true for all same suit" do
      expect(Hand.flush?([:h, :h, :h, :h, :h])).to be true
    end

    it "return false for different suits" do
      expect(Hand.flush?([:h, :h, :h, :h, :c])).to be false
    end
  end

  describe "#four?" do
    it "returns false for 3 of a kind" do
      expect(Hand.four?([1, 1, 1, 2, 2])).to be false
    end

    it "return true for 4 of a kind" do
      expect(Hand.four?([1, 3, 3, 3, 3])).to be true
    end
  end





end
