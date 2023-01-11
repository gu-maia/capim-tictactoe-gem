# frozen_string_literal: true

class Board
  require_relative 'color'
  require_relative 'grid'

  include Color

  attr_reader :spots, :grid

  def initialize
    @spots = %w[0 1 2 3 4 5 6 7 8]
    @grid = Grid.new
  end

  def valid_line?(set)
    set.each do |line|
      return true if line.uniq.length == 1
    end
    false
  end

  def center_marked?
    @grid.get_at(4) != '4'
  end

  def mark_center(marker)
    @grid.spot_marker(4, marker)
  end

  def available_spots
    @grid.spots.select { |spot| %(0 1 2 3 4 5 6 7 8).include?(spot) }
  end

  def game_over?(spots = @grid.spots)
    valid_line?(@grid.rows(spots)) || valid_line?(@grid.columns(spots)) || valid_line?(@grid.diagonals(spots))
  end

  def tie?
    @grid.spots.all? { |spot| [x_marker, o_marker].include?(spot) }
  end
end
