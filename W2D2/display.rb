require 'byebug'
require "colorize"
require_relative "cursor"
require_relative "board"

class Display
  attr_accessor :cursor, :board

  def initialize
    @board = Board.set_up 
    @cursor = Cursor.new([0,0], @board)
  end

  def start
    loop do
      print "\n"
      render
      @cursor.get_input
    end 
  end
  
  def render
    
    8.times do |idx|
      print_row(idx)
    end
  end
    
  def print_row(row)
    if row.even?
      color_arr = [:blue, :green]
    else
      color_arr = [:green, :blue]
    end
    
    4.times do
      print "       ".colorize(:background => color_arr.first)
      print "       ".colorize(:background => color_arr.last)
    end
    print "\n" 
    4.times do |col|
      if @cursor.cursor_pos.first == row && @cursor.cursor_pos.last == col * 2
        print "   #{@board[[row, col*2]]}   ".colorize(:color => :red, :background => color_arr.first)
      else 
        print "   #{@board[[row, col*2]]}   ".colorize(:color => @board[[row, col*2]].color, :background => color_arr.first)
      end
      
      if @cursor.cursor_pos.first == row && @cursor.cursor_pos.last == col * 2 + 1
        print "   #{@board[[row, col*2+1]]}   ".colorize(:color => :red, :background => color_arr.last)
      else
        print "   #{@board[[row, col*2+1]]}   ".colorize(:color => @board[[row, col*2+1]].color, :background => color_arr.last)
      end
    end
    print "\n"
    4.times do
      print "       ".colorize(:background => color_arr.first)
      print "       ".colorize(:background => color_arr.last)
    end
    print "\n"
  end
end

d = Display.new
d.start
