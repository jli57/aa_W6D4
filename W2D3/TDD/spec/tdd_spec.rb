require "tdd.rb"
require "rspec"

RSpec.describe do #maybe change

  let(:sample_arr) {[-1, 0, 2, -2, 1]}

  describe "#my_uniq" do

    it "takes an array" do
      expect { my_uniq("Horse") }.to raise_error(ArgumentError)
    end

    it "returns an array" do
      expect(my_uniq(sample_arr)).to be_instance_of(Array)
    end

    it "returns no duplicate values" do
      expect(my_uniq(sample_arr)).to eq(sample_arr.uniq)
    end
  end

  describe "#two_sum_two" do
    it "takes an array" do
      expect { two_sum_two("Camel") }.to raise_error(ArgumentError)
    end

    it "returns an array" do
      expect(two_sum_two(sample_arr)).to be_instance_of(Array)
    end

    it "sums values correctly and returns indexes" do
      expect(two_sum_two(sample_arr)).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#my_transpose" do
    let(:sample_square) {[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
    ]}

    let(:answer_square) {[
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
    ]}

    let(:sample_rekt) {[
      [0, 1, 2],
      [3, 4, 5]
      ]}

    let(:answer_rekt) {[
      [0,3],
      [1,4],
      [2,5]
      ]}

    it "correctly transposes square array" do
      expect(my_transpose(sample_square)).to eq(answer_square)
    end

    it "correctly transposes rectangular array" do
      expect(my_transpose(sample_rekt)).to eq(answer_rekt)
    end

  end

  describe "#stock_picker" do
    let(:price_stock) {[3, 7, 2, 1, 6]}

    it "takes an array" do
      expect { stock_picker("Camel") }.to raise_error(ArgumentError)
    end

    it "finds the best day to buy and sell" do
      expect(stock_picker(price_stock)).to eq([3,4])
    end
  end


  subject(:tower) {[[3,2],[1],[]]}

  describe "#move" do


    it "raises an error for empty tower" do
      expect{ move(tower,2,1) }.to raise_error("Invalid tower: Empty tower")
    end

    it "raises an error for invalid move" do
      expect{ move(tower,0,1) }.to raise_error("Invalid tower move")
    end

    it "properly moves disc" do
      expect(move(tower,1,0)).to eq([[3, 2, 1], [], []])
    end
  end

  describe "#won?" do
    let (:tower1) {[[3,2,1],[],[]]}

    it "displays false when game is not won" do
      expect(won?(tower)).to be false
      expect(won?(tower1)).to be false
    end

    let (:tower2) {[[],[3,2,1],[]]}
    it "displays true when game is won" do
      expect(won?(tower2)).to be true
    end
  end

  describe "#towers_of_hanoi" do

    it "raises error with improper starting position" do
      expect {towers_of_hanoi(Array.new(3, []))}.to raise_error(ArgumentError)
    end
  end

end
