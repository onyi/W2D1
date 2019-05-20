class InvalidMoveError < StandardError; end

class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(8) {Array.new(8)}
    @grid[0][0] = 1
  end

  def move_piece(start_pos, end_pos)
    valid_positions = [0, 1, 2, 3, 4, 5, 6, 7]   # in our case, nil refers to an empty position
    
    positions = (start_pos += end_pos).flatten  

    raise InvalidMoveError if positions.any? {|position| !valid_positions.include?(position)}
    
    if @grid[start_pos[0]][start_pos[1]].nil? 
      raise InvalidMoveError, 'There is no piece to be moved at this position.'
    end 

    if !@grid[end_pos[0]][end_pos[1]].nil?
      raise InvalidMoveError, 'There is already a piece at this position.'
    end 

    @grid[end_pos[0]][end_pos[1]] = @grid[start_pos[0]][start_pos[1]]
    @grid[start_pos[0]][start_pos[1]] = nil
  end

end

example = Board.new
example.move_piece([9,0], [1,1])
