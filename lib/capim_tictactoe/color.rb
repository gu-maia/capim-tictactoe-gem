# frozen_string_literal: true

module Color
  require 'rainbow'

  def pipe
    Rainbow(' | ').red.to_s
  end

  def line
    Rainbow("\n---+---+---\n").red.to_s
  end

  def x_marker
    Rainbow('X').green
  end

  def o_marker
    Rainbow('O').blue
  end
end
