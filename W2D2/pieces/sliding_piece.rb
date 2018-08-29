require_relative "piece"

module SlidingPiece
  def moves(direction)
    case direction
    when :horizontal
      poss_moves = moves_helper(0, 1)
      poss_moves += moves_helper(0, -1)
      poss_moves += moves_helper(1, 0)
      poss_moves += moves_helper(-1, 0)
    when :diagonal
      poss_moves = moves_helper(1, 1)
      poss_moves += moves_helper(-1, 1)
      poss_moves += moves_helper(-1, -1)
      poss_moves += moves_helper(1, -1)
    end
    poss_moves
  end
  
  def moves_helper(row_dif, col_dif)
    moves_arr = []
    
    
    row, col = self.position.first + row_dif, self.position.last + col_dif
  
    while row >= 0 && row <= 7 && col >= 0 && col <= 7
      if @board[[row, col]].is_a?(NullPiece)
        moves_arr << [row, col]
        row += row_dif
        col += col_dif
      else
        moves_arr << [row, col] if @board[[row, col]].color != self.color
        break
      end
    end
    
    moves_arr
  end 
end

class Rook < Piece
  include SlidingPiece
  
  def initialize(position, board, color)
    super
  end
  
  def inspect
    "R"
  end
  
  def to_s
    "R"
  end
  
  def get_moves
    moves(:horizontal)
  end 
end

class Bishop < Piece
  include SlidingPiece
  
  def initialize(position, board, color)
    super
  end
  
  def inspect
    "B"
  end
  
  def to_s
    "B"
  end
  
  def get_moves
    moves(:diagonal)
  end 
end

class Queen < Piece
  include SlidingPiece
  
  def initialize(position, board, color)
    super
  end
  
  def inspect
    "Q"
  end
  
  def to_s
    "Q"
  end
  
  def get_moves
    moves(:horizontal) + moves(:diagonal)
  end 
end