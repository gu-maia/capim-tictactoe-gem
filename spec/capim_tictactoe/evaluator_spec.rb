# frozen_string_literal: true

require_relative '../spec_helper'
RSpec.describe Evaluator do
  let(:evaluator) { Class.new { extend Evaluator } }
  let(:board) { Board.new }
  let(:human_marker) { 'O' }
  let(:computer_marker) { 'X' }
  let(:random_game_mode) { %i[easy hard].sample }

  context '#eval_board' do
    it 'receives a board with unmarked center, it should mark the center and return' do
      expect(board.center_marked?).to eq(false)

      evaluator.eval_board(board, human_marker, computer_marker, random_game_mode)

      expect(board.center_marked?).to eq(true)
    end
  end

  context '#get_best_move' do
    let(:player_about_to_win) { Board.new }

    it 'should mark the spot that would make the player win, when in hard_mode' do
      # O | O | 2
      # 3 | X | 5
      # 6 | 7 | 8
      player_about_to_win.grid.spot_marker(0, human_marker)
      player_about_to_win.grid.spot_marker(1, human_marker)
      player_about_to_win.grid.spot_marker(4, computer_marker)

      expect(player_about_to_win.grid.marked?(2)).to eq(false)

      evaluator.eval_board(player_about_to_win, human_marker, computer_marker, :hard)

      expect(player_about_to_win.grid.get_at(2)).to eq(computer_marker)
    end

    let(:computer_about_to_win) { Board.new }

    it 'should mark the spot that would make the machine win' do
      # O | X | O
      # 3 | X | 5
      # 6 | 7 | 8
      computer_about_to_win.grid.spot_marker(0, human_marker)
      computer_about_to_win.grid.spot_marker(2, human_marker)
      computer_about_to_win.grid.spot_marker(1, computer_marker)
      computer_about_to_win.grid.spot_marker(4, computer_marker)

      expect(player_about_to_win.grid.marked?(7)).to eq(false)

      evaluator.eval_board(computer_about_to_win, human_marker, computer_marker, random_game_mode)

      expect(computer_about_to_win.grid.get_at(7)).to eq(computer_marker)
    end
    let(:no_best_move) { Board.new }

    it 'has no particular best move, so it should mark a random available spot' do
      # O | X | O
      # X | 4 | 5
      # 6 | 7 | 8
      no_best_move.grid.spot_marker(0, human_marker)
      no_best_move.grid.spot_marker(2, human_marker)
      no_best_move.grid.spot_marker(1, computer_marker)
      no_best_move.grid.spot_marker(3, computer_marker)

      available_spots = no_best_move.available_spots
      random_move = evaluator.get_best_move(no_best_move, human_marker, computer_marker, random_game_mode)

      expect(available_spots).to include(random_move.to_s)
    end

    context '#winning_move?' do
      it 'needs to ensure that the board instance variable is not mutated to avoid unpredictable behavior' do
        board_before_method_call = board

        evaluator.winning_move?(board, human_marker, 0)

        expect(board).to eq(board_before_method_call)
      end

      let(:has_winning_move) { Board.new }
      before do
        # O | O | 2
        # 3 | 4 | 5
        # 6 | 7 | 8
        has_winning_move.grid.spot_marker(0, human_marker)
        has_winning_move.grid.spot_marker(1, human_marker)
      end
      it 'is a winning move' do
        expect(evaluator.winning_move?(has_winning_move, human_marker, 2)).to eq(true)
      end
      it 'is is not a winning move' do
        expect(evaluator.winning_move?(has_winning_move, human_marker, 3)).to eq(false)
      end
    end
  end
end
