require_relative 'board_dependencies'

class Board
  attr_reader :grid

  NIL_ROW = [nil, nil, nil, nil, nil, nil, nil, nil]
  PAWN_ROW = [:pawn, :pawn, :pawn, :pawn, :pawn, :pawn, :pawn, :pawn]
  PIECE_ROW = [:rook, :knight, :bishop, :queen, :king, :bishop, :knight, :rook]
  DEFAULT_BOARD = [PIECE_ROW, PAWN_ROW, NIL_ROW, NIL_ROW, NIL_ROW, NIL_ROW, PAWN_ROW, PIECE_ROW]

  def initialize
    @grid = generate_board
    # Array.new(8) do |row|
    #   if [0, 1, 6, 7].include?(row)
    #     Array.new(8) { |col| Piece.new(self, [row, col], :red) }
    #   else
    #     Array.new(8) { nil }
    #   end
    # end
  end

  def generate_board
    new_board = []
    current_color = :white
    DEFAULT_BOARD.each_with_index do |row, row_index|
      current_color = :black if row_index > 3
      new_row = []
      row.each_with_index do |piece, col_index|
        new_row << new_piece(piece, [row_index, col_index],current_color)
      end
      new_board << new_row
    end
    new_board
  end

  def move(start, end_position)
    raise "There is no piece there" unless grid[start].is_a?(Piece)
    raise "Cannot move there" if valid_end_position?(end_position)

  end

  def [](*pos)
    grid[pos[0]][pos[1]]
  end

  def []=(*pos, value)
    grid[pos[0]][pos[1]] = value
  end

  def valid_end_position?(end_position)
      in_bounds?(end_position) &&
      !grid[end_position].is_a?(Piece)
  end

  def in_bounds?(pos)
    pos.all? { |x| x.between?(0, 7) }
  end


  def new_piece(name, position, color)
    case name
    when :pawn
      Pawn.new(self, position, color)
    when :rook
      Rook.new(self, position, color)
    when :knight
      Knight.new(self, position, color)
    when :bishop
      Bishop.new(self, position, color)
    when :queen
      Queen.new(self, position, color)
    when :king
      King.new(self, position, color)
    else
      nil
    end
  end

end
