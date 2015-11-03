require_relative 'board'
require_relative './cursor/cursorable'

#[:black, :light_black, :red, :light_red, :green, :light_green,
#:yellow, :light_yellow, :blue, :light_blue, :magenta, :light_magenta,
#:cyan, :light_cyan, :white, :light_white, :default]

class Display
  include Cursorable

  @@black = {pawn: "\u265F", knight: "\u265E", bishop: "\u265D",
    rook: "\u265C", queen: "\u265B", king: "\u265A"}

  @@white = {pawn: "\u2659", knight: "\u2658", bishop: "\u2657",
    rook: "\u2656", queen: "\u2655", king: "\u2654"}

  attr_reader :board, :cursor_pos
  attr_accessor :selected

  def initialize
    @board = Board.new
    @cursor_pos = [0,0]
    @selected = nil
  end

  def render
    system("clear")
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    puts "\#   0   1   2   3   4   5   6   7 "
    @board.grid.each_with_index do |row, row_index|
      print "#{row_index} "
      row.each_with_index do |square, col_index|
        render_piece(square, row_index, col_index)
      end
      puts
    end
  end

  def render_piece(square, row_index, col_index)
    #piece vs empty

    color_hash = square.color == :white ? @@white : @@black if square
    # puts"yo" if color_hash == @@black

    if square.is_a?(Piece)
      str = " #{color_hash[square.to_sym]}  "
    else
      str = "    "
    end

    #black vs white square
    if [row_index, col_index] == @cursor_pos
      background = :light_blue
    elsif (col_index + row_index).even?
      background = :light_black
    else
      background = :default #:white
    end

    if [row_index, col_index] == @selected
      background = :light_red
    end



    #black vs white piece
    #if square.color == :black

    print str.colorize(background: background)
  end

end
