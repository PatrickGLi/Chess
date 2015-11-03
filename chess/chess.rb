require_relative 'display'

class Chess
  # include Cursorable

  attr_reader :display, :board

  def initialize
    @display = Display.new
    @board = @display.board
  end

  def play #NB move to GAME METHOD
    while true
      display.render
      user_input = display.get_input
      display.selected = user_input if user_input
    end
  end






end


game = Chess.new

game.play
