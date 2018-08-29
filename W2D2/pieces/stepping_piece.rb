require_relative "piece"
module SteppingPiece
  def moves
    if is_a?(King)
      possible_moves = [moves_helper(0, 1)] + [moves_helper(0, -1)] + [moves_helper(1, 0)] + [moves_helper(-1, 0)] +
                       [moves_helper(1, 1)] + [moves_helper(-1, 1)] + [moves_helper(-1, -1)] + [moves_helper(1, -1)]
                       
      possible_moves.reject {|move| move.nil?}
  
    else
      row = self.position.first
      col = self.position.last
      
      moves = [[row - 2, col - 1],[row - 2, col + 1],[row - 1, col + 2],[row + 1, col + 2],
              [row + 2, col + 1],[row + 2, col - 1],[row + 1, col - 2],[row - 1, col - 2]]

      possible_moves = moves.select {|move| move.first >= 0 && move.first <= 7 && move.last >= 0 && move.last <= 7}
      possible_moves.reject  {|move| @board[move].color == self.color}
    end
  end

  
  def moves_helper(row_dif, col_dif)
    row, col = self.position.first + row_dif, self.position.last + col_dif
  
    if row >= 0 && row <= 7 && col >= 0 && col <= 7
      [row, col] unless board[[row, col]].color == self.color
    end
  end 
end


class King < Piece
  include SteppingPiece
  
  def initialize(position, board, color)
    super
  end
  
  def inspect
    "K"
  end
  
  def to_s
    "K"
  end
  
  def get_moves
    moves
  end 
end

class Knight < Piece
  include SteppingPiece
  
  def initialize(position, board, color)
    super
  end
  
  def inspect
    "H"
  end
  
  def to_s
    "H"
  end
  
  def get_moves
    moves
  end 
end