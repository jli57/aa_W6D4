require "singleton"

class Piece
  attr_accessor :position, :board
  attr_reader :color
  
  def initialize(position, board, color)
    @position = position
    @board = board
    @color = color 
  end
  
  def inspect
    "b"# "#{b}"
  end
  
  def to_s
    "b"
  end
end

class Pawn < Piece

  def initialize(position, board, color)
    super
  end

  def inspect
    "P"
  end

  def to_s
    "P"
  end

  def get_moves
    moves_arr = []
    row, col = self.position.first, self.position.last
    if @color == :black
      if @board[[row + 1, col]].is_a?(NullPiece)
        moves_arr << [row + 1, col]
        moves_arr << [row + 2, col] if @board[[row + 2, col]].is_a?(NullPiece) && row == 1
      end  
      
      #diagonal attacks
      moves_arr << [row+1, col-1] if col > 0 && @board[[row+1, col-1]].color == :white
      moves_arr << [row+1, col+1] if col < 7 && @board[[row+1, col+1]].color == :white
    elsif @color == :white
      #pawn is white
      if @board[[row - 1, col]].is_a?(NullPiece)
        moves_arr << [row - 1, col]
        moves_arr << [row - 2, col] if @board[[row - 2, col]].is_a?(NullPiece) && row == 6
      end  
      
      #diagonal attacks
      moves_arr << [row-1, col-1] if col > 0 && @board[[row-1, col-1]].color == :black
      moves_arr << [row-1, col+1] if col < 7 && @board[[row-1, col+1]].color == :black
    end
    
    moves_arr
      
  end
end

class NullPiece < Piece
  include Singleton
  
  attr_accessor :color
  
  def initialize
    @color = :none
  end
  
  def inspect
    " "
  end
  
  def to_s
    " "
  end 
end