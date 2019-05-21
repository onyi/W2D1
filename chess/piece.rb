require 'singleton'
require_relative 'slideable.rb'
require_relative 'stepable.rb'

class Piece

  def initialize(letter = nil)
    @display_letter = letter
  end

  def to_s
    @display_letter
  end

end

class NullPiece < Piece
  include Singleton

  def initialize
    super("  ")
  end

end

class Rook < Piece
  include Slideable

  def initialize
    super("RO")
  end

  def move_dirs

  end

  def moves

  end
end

class Queen < Piece
  include Slideable

  def initialize
    super("QU")
  end
end

class Knight < Piece
  include Stepable

  def initialize
    super("KN")
  end
end

class Bishop < Piece
  include Slideable

  def initialize
    super("BI")
  end
end



class King < Piece
  include Stepable
  
  def initialize
    super("KI")
  end
end

class Pawn < Piece
  def initialize
    super("PA")
  end
end

