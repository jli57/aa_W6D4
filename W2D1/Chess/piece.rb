require "singleton" 

class Piece
  attr_accessor :name
  def initialize(name="Bob")
    @name = name
  end
  
  def inspect
    "#{@name}"
  end
end

class NullPiece < Piece
  include Singleton
  
  attr_accessor :name
  
  def initialize(name=nil)
    @name = nil
  end
end