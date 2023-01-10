require_relative 'capim_tictactoe/game'

class Capimtictactoe
  def self.start
    Game.new.start_game
  end
end
