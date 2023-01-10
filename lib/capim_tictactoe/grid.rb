# frozen_string_literal: true

class Grid
  require_relative 'color'

  include Color

  attr_reader :grid
  alias spots grid

  def initialize
    @grid = %w[0 1 2 3 4 5 6 7 8]
  end

  def display
    rows.each do |row|
      print " #{row.join(pipe)} "
      print line
    end
  end

  def get_at(index)
    @grid[index]
  end

  def rows(spots = grid)
    spots.each_slice(3)
  end

  def columns(spots)
    rows(spots).to_a.transpose
  end

  def diagonals
    [[@grid[0], @grid[4], @grid[8]], [@grid[2], @grid[4], @grid[6]]]
  end

  def spot_marker(spot, marker)
    @grid[spot] = marker
  end

  def marked?(spot)
    [x_marker, o_marker].include?(@grid[spot])
  end
end
