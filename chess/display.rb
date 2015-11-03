require_relative 'board'
require_relative './cursor/cursorable'


class Display
  include Cursorable

  attr_reader :board

  def initialize(board)
    @board = board
    @cursor_pos = [0,0]
    @selected = nil
  end

  def play #NB move to GAME METHOD
    while true
      render
      user_input = get_input
      @selected = user_input if user_input
    end
  end

  def render
    system("clear")
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    puts "\#  0  1  2  3  4  5  6  7 ".colorize(:light_blue)
    @board.grid.each_with_index do |row, row_index|
      print "#{row_index} ".colorize(:light_blue)
      row.each_with_index do |square, col_index|
        render_piece(square, row_index, col_index)
      end
      puts
    end
  end

  def render_piece(square, row_index, col_index)
    #piece vs empty
    if square.is_a?(Piece)
      str = " #{square.to_s} "
    else
      str = "   "
    end

    #black vs white square
    if [row_index, col_index] == @cursor_pos
      background = :light_blue
    elsif (col_index + row_index).even?
      background = :black
    else
      background = :light_white
    end

    if [row_index, col_index] == @selected
      background = :yellow
    end



    #black vs white piece
    #if square.color == :black

    print str.colorize(background: background)
  end

end

d = Display.new(Board.new())
d.play
