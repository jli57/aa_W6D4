require_relative "piece"
require 'colorize'
require "byebug"


class Board
  attr_accessor :grid
  
  def self.set_up
    
    n = NullPiece.instance
    grid = [[Piece.new,Piece.new,Piece.new,Piece.new,Piece.new,Piece.new,Piece.new,Piece.new],
     [Piece.new,Piece.new,Piece.new,Piece.new,Piece.new,Piece.new,Piece.new,Piece.new],
     [n, n, n, n, n, n, n, n],
     [n, n, n, n, n, n, n, n],
     [n, n, n, n, n, n, n, n],
     [n, n, n, n, n, n, n, n],
     [Piece.new,Piece.new,Piece.new,Piece.new,Piece.new,Piece.new,Piece.new,Piece.new],
     [Piece.new,Piece.new,Piece.new,Piece.new,Piece.new,Piece.new,Piece.new,Piece.new]]
    Board.new(grid)
  end
  
  def initialize(grid = Array.new(8) {Array.new(8)})
    @grid = grid
  end
  
  def [](pos)
    @grid[pos.first][pos.last]
  end
  
  def []=(pos, val)
    @grid[pos.first][pos.last] = val
  end
  
  def move_piece(start_pos, end_pos)
    # debugger
    raise ArgumentError if self[start_pos].is_a?(NullPiece)
    raise ArgumentError unless self[end_pos].is_a?(NullPiece)
    
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.instance
    
  end
  
  def self.valid_pos?(pos)
    return pos.first < 0 && pos.first > 7 && pos.last < 0 && pos.first > 7
  end
  
  def valid_move?(start_pos, end_pos)
    
  end
end

b = Board.set_up

b.move_piece([0,0], [5,5])
p b[[0,0]]
p b[[5,5]]
# [Pawn, Pawn, Pawn, Pawn, Pawn, Pawn, Pawn, Pawn],
# [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]]