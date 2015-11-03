class Pawn < SteppingPiece

  attr_reader :has_moved

  def initialize(board, position, color)
    @has_moved = false
    super
  end

  def move_directions
    moves = [[1,0], [1,1], [1,-1]]
    moves << [2,0] unless has_moved
    moves
  end

  def moves
    moves = []
    next_move = [position[0] + 1, position[1]]
    moves << [1, 0] if board[next_move].nil? && board.in_bounds?(next_move)
    next_move = [position[0] + 2, position[1]]
    moves << [2, 0] if board[next_move].nil? && !has_moved
    next_move = [position[0] + 1, position[1] + 1]
    moves << [1, 1] if board[next_move] && board[next_move].color != self.color
    next_move = [position[0] + 1, position[1] - 1]
    moves << [1, -1] if board[next_move] && board[next_move].color != self.color
    moves
  end

  def to_s
    "P".colorize(color)
  end

  def to_sym
    :pawn
  end


end

possible_next_moves = []
self.move_directions.each do |direction|
  next_move = [position[0] + direction[0], position[1] + direction[1]]
  if (board[next_move].nil? && board.in_bounds?(next_move)) || board[next_move].color != self.color
    possible_next_moves << next_move
  end
end
possible_next_moves
