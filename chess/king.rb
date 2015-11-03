class King < SteppingPiece

  def initialize(board, position, color)
    super
  end

  def move_directions

  end

  def to_s
    "K".colorize(color)
  end


end
