class Knight < SteppingPiece

  def initialize(board, position, color)
    super
  end

  def move_directions

  end

  def to_s
    "k".colorize(color)
  end


end
