require 'colorize'
require_relative "cursor"

class Display
  
  
  def initialize
    @cursor Cursor.new([0,0])
  end
end