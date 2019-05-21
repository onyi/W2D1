require 'colorize'
require_relative 'cursor.rb'
require_relative 'board.rb'

class Display

  attr_reader :cursor
  def initialize
    @board = Board.instance
    @cursor = Cursor.new([0, 0], @board)
  end

  def render
    # Render using colorize if @cursor.selected and at @cursor.current_pos
    puts "  1  2  3  4  5  6  7  8"
    @board.grid.each_with_index do |row, idx|
      rowstr = "#{idx + 1} "
      row.each do |ele|
        cur = ele.to_s
        rowstr += cur.blue + " "
      end
      puts rowstr
    end

  end

end

x = Display.new
p x.render