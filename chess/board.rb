require_relative 'piece.rb'

class InvalidMoveError < StandardError; end

class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(8) {Array.new(8)}
    # @grid[0][0] = 1
    # Row 0 and 7: rook, knight, bishop, queen, king, bishop, knight, and rook
    # Row 1 and 6: all pawn
    @grid[0] = [Rook.new(), Knight.new(), Bishop.new(), Queen.new(), King.new(), Bishop.new(), Knight.new(), Rook.new()]
    @grid[7] = [Rook.new(), Knight.new(), Bishop.new(), Queen.new(), King.new(), Bishop.new(), Knight.new(), Rook.new()]
    @grid[1] = [Pawn.new(), Pawn.new(), Pawn.new(), Pawn.new(), Pawn.new(), Pawn.new(), Pawn.new(), Pawn.new()]
    @grid[6] = [Pawn.new(), Pawn.new(), Pawn.new(), Pawn.new(), Pawn.new(), Pawn.new(), Pawn.new(), Pawn.new()]
  end

  def move_piece(start_pos, end_pos)
    x_s, y_s = start_pos[0], start_pos[1]
    x_e, y_e = end_pos[0], end_pos[1]
    valid_positions = [0, 1, 2, 3, 4, 5, 6, 7]   # in our case, nil refers to an empty position
    
    positions = (start_pos += end_pos).flatten  

    raise InvalidMoveError if positions.any? {|position| !valid_positions.include?(position)}
    
    if @grid[x_s][y_s].nil? 
      raise InvalidMoveError, 'There is no piece to be moved at this position.'
    end 

    if !@grid[x_e][y_e].nil?
      raise InvalidMoveError, 'There is already a piece at this position.'
    end 

    @grid[x_e][y_e] = @grid[x_s][y_s]
    @grid[x_s][y_s] = nil
  end

end

example = Board.new
p example.grid
example.move_piece([0,0], [4,5])
p example.grid
# example.move_piece([9,0], [1,1])
