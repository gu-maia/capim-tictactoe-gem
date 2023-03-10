# frozen_string_literal: true

class Game
  require_relative 'board'
  require_relative 'evaluator'
  require_relative 'color'
  require_relative 'presenter'
  require_relative 'input_handler'

  include Color
  include Evaluator
  include Presenter
  include InputHandler

  def initialize
    @board = Board.new
    @computer = x_marker
    @human = o_marker
    parse_args
  end

  def start_game
    present_game

    until @board.game_over? || @board.tie?
      fetch_human_spot(@board, @human)

      eval_board(@board, @human, @computer, @options[:game_mode]) unless @board.game_over? || @board.tie?
      @board.grid.display
    end

    puts @board.tie? ? "I'ts a tie!" : 'Game over'
  end
end
