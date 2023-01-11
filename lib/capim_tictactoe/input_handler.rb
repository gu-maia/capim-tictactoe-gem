# frozen_string_literal: true

require 'rainbow'

module InputHandler
  def fetch_human_spot(board, human_marker)
    spot = nil
    loop do
      spot = gets.chomp

      spot = validate_input(board, spot)
      break if spot

      puts "Please enter a valid integer that corresponds to an empty spot (#{board.available_spots.join(', ')})"
    end
    board.grid.spot_marker(spot, human_marker)
  end

  def parse_args
    @options = { game_mode: :hard, ascii_art: true, jokes: true }
    OptionParser.new do |opts|
      opts.banner = Rainbow('Usage: capim_tictactoe [options], the game will default to challenging mode.').red

      opts.on('-e', '--easy', 'Runs the game in easy mode.') do
        @options[:game_mode] = :easy
      end
      opts.on('-a', '--noart', 'Runs the game without ASCII art.') do
        @options[:ascii_art] = false
      end
      opts.on('-j', '--nojokes', 'Runs the game without the silly lines.') do
        @options[:jokes] = false
      end
    end.parse!
  end

  private

  # to_i converts 'non integer' strings to 0: 'a'.to_i => 0.
  # this method is used to verify if the input is conversible to integer
  def integer?(input)
    input.to_i.to_s == input
  end

  def within_range?(spot)
    spot.between?(0, 8)
  end

  def validate_input(board, input)
    return false unless integer?(input)

    spot = input.to_i

    return false unless within_range?(spot)

    return false if board.grid.marked?(spot)

    spot
  end
end
