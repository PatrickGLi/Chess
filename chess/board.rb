require_relative 'piece'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) do |row|
      if [0, 1, 6, 7].include?(row)
        Array.new(8) { Piece.new }
      else
        Array.new(8) { nil }
      end
    end
  end

  def move(start, end_pos)
    if grid[start].is_a?(Piece)

    end
  end

  def [](*pos)
    grid[pos[0]][pos[1]]
  end

  def []=(*pos, value)
    grid[pos[0]][pos[1]] = value
  end



end


board = Board.new
p board.grid
