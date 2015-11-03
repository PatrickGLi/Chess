require 'colorize'
require_relative 'board'


class Piece
  attr_reader :board, :position, :color

  def initialize(board, position, color)
    @board = board
    @position = position
    @color = color
  end

  def moves

  end

  def to_s
    "P".colorize(:red)
  end


end
