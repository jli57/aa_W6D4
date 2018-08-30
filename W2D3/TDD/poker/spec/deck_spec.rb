require "rspec"
require "deck.rb"

RSpec.describe Deck do
  subject(:testdeck) { Deck.new}

  describe "#initialize" do


    it "raises an error if deck is not right type or length" do
      expect { Deck.new("hourse") }.to raise_error(ArgumentError)
    end

    it "makes a deck of 52 cards" do
      expect(testdeck.stack.all?{|el| el.is_a?(Card)}).to be true
      expect(testdeck.stack.legnth).to eq(52)
    end

    it "uniq returns true if deck is unique" do
      expect(Deck.uniq?(testdeck.stack)).to be true
    end

    it "raises error if deck has duplicate cards" do


      expect{ Deck.new([Card.new(2, :h)] + stacked_deck[1..-1]) }.to raise_error("Stacked deck error")
    end

  end


end
