require 'colorize'
require_relative 'cursor.rb'

class Display

  attr_reader :cursor
  def initialize
    @board = Board.instance
    @cursor = Cursor.new([0, 0], @board)
  end

  def render
    # Render using colorize if @cursor.selected and at @cursor.current_pos
    p "  1  2  3  4  5  6  7  8"
    @board.grid.each_with_index do |row, idx|
      rowstr = "#{idx + 1} "
      row.each do |ele|
        cur = ele.to_s
        rowstr += cur + " "
      end
      p rowstr
    end

  end

end

# d = Display.new
# d.render
# d.cursor.get_input