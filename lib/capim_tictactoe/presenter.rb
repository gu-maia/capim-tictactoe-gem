# frozen_string_literal: true

module Presenter
  require_relative 'silly_line'
  require_relative 'ascii_art'

  SILLY_LINE = SillyLine::LINES.sample
  GREEN_GRASS = AsciiArt::GREEN_GRASS

  def present_game
    print "#{GREEN_GRASS}\n" if @options[:ascii_art]
    puts "\n#{SILLY_LINE}\n\n" if @options[:jokes]
    @board.grid.display
    puts 'Enter [0-8]'
  end
end
