class Pawn < SteppingPiece

  def initialize(board, position, color)
    super
  end

  def move_directions
    
  end

  def to_s
    "P".colorize(color)
  end


end
