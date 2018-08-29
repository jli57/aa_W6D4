require_relative "pieces/piece"
require_relative "pieces/stepping_piece"
require_relative "pieces/sliding_piece"
require "byebug"


class Board
  attr_accessor :grid
  
  def self.get_pieces_row(row, board, color)
    [Rook.new([row, 0], board, color), Knight.new([row, 1], board, color), Bishop.new([row, 2], board, color),
    Queen.new([row, 3], board, color), King.new([row, 4], board, color), Bishop.new([row, 5], board, color), 
    Knight.new([row, 6], board, color), Rook.new([row, 7], board, color)]
  end
  
  def self.get_pawns_row(row, board, color)
    [Pawn.new([row,0], board, color),Pawn.new([row,1], board, color),Pawn.new([row,2], board, color),
    Pawn.new([row,3], board, color),Pawn.new([row,4], board, color),Pawn.new([row,5], board, color),
    Pawn.new([row,6], board, color), Pawn.new([row,7], board, color)]
  end
  
  def self.set_up
    nb = Board.new
    n = NullPiece.instance
    start_grid = [
      Board.get_pieces_row(0, nb, :black),
      Board.get_pawns_row(1, nb, :black),
      [n,n,n,n,n,n,n,n],
      [n,n,n,n,n,n,n,n],
      [n,n,n,n,n,n,n,n],
      [n,n,n,n,n,n,n,n],
      Board.get_pawns_row(6, nb, :white),
      Board.get_pieces_row(7, nb, :white)
    ]
    nb.grid = start_grid
    nb
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
  
  def valid_pos?(pos)
    return pos.first >= 0 && pos.first <= 7 && pos.last >= 0 && pos.first <= 7
  end
  
  # def valid_move?(start_pos, end_pos)
  # 
  # end
  
  def inspect
    @grid.each {|row| p row.join(" ")}
    nil
  end 
end

checkmark = "\u2659"
p checkmark.encode('utf-8')
b = Board.set_up
p b[[6,1]].position

# [Pawn, Pawn, Pawn, Pawn, Pawn, Pawn, Pawn, Pawn],
# [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]]