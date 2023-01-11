# frozen_string_literal: true

module Evaluator
  def eval_board(board, human_marker, computer_marker, game_mode)
    # EASY behavior:
    # 1 - Mark center if available
    # 2 - Go through all available moves and checks if one of them is the winning move.
    # 3 - If not, mark a random spot.
    #
    # HARD behavior:
    # 1 - Mark center if available.
    # 2 - Go through all available moves and checks if one of them is the winning move for both the machine or the player.
    # 3 - If not, mark a random spot.

    unless board.center_marked?
      board.mark_center(computer_marker)
      return
    end

    spot = get_best_move(board, human_marker, computer_marker, game_mode)
    board.grid.marked?(spot) ? nil : board.grid.spot_marker(spot, computer_marker)
  end

  def get_best_move(board, human_marker, computer_marker, game_mode)
    best_move = nil

    board.available_spots.each do |available_spot|
      if winning_move?(board, computer_marker, available_spot.to_i)
        best_move = available_spot.to_i
        return best_move
      end

      best_move = available_spot.to_i if game_mode == :hard && winning_move?(board, human_marker, available_spot.to_i)
    end
    return best_move if best_move

    board.available_spots.sample.to_i
  end

  def winning_move?(board, marker, spot)
    # A tmp board is used to avoid mutating the board instance variable spots.
    tmp_board = board.grid.spots.dup
    tmp_board[spot] = marker

    board.game_over?(tmp_board)
  end
end
