# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe Board do
  let(:board) { Board.new }

  let(:board_valid_row) { Board.new }
  let(:board_valid_column) { Board.new }
  let(:board_valid_diagonal) { Board.new }

  before do
    board_valid_row.grid.spot_marker(0, 'X')
    board_valid_row.grid.spot_marker(1, 'X')
    board_valid_row.grid.spot_marker(2, 'X')

    board_valid_column.grid.spot_marker(0, 'X')
    board_valid_column.grid.spot_marker(3, 'X')
    board_valid_column.grid.spot_marker(6, 'X')

    board_valid_diagonal.grid.spot_marker(0, 'X')
    board_valid_diagonal.grid.spot_marker(4, 'X')
    board_valid_diagonal.grid.spot_marker(8, 'X')
  end

  context 'initialize' do
    it 'should instantiate spots' do
      expect(board.spots).to eq(%w[0 1 2 3 4 5 6 7 8])
    end

    it 'should instantiate a grid' do
      expect(board.grid).to be_a Grid
    end
  end

  # There's no point in testing all possible variations of rows, columns and diagonals because the method will always receive a set of three lines, independent of their 'orientation' on the board.
  context '#valid_line?' do
    # X | X | X
    # O | O | X
    # X | X | O
    let(:valid_rows) { [%w[X X X], %w[O O X], %w[X X O]] }

    # O | O | X
    # O | X | O
    # X | O | X
    let(:invalid_rows) { [%w[O O X], %w[O X O], %w[X O X]] }

    it 'receives a valid set of lines' do
      expect(board.valid_line?(valid_rows)).to eq(true)
    end

    it 'receives a valid set of lines' do
      expect(board.valid_line?(invalid_rows)).to eq(false)
    end
  end

  context '#center_marked?' do
    let(:center_marked) { Board.new }
    let(:center_unmarked) { Board.new }

    it 'should be truthy' do
      center_marked.mark_center('X')
      expect(center_marked.center_marked?).to eq(true)
    end

    it 'should be falsey' do
      expect(center_unmarked.center_marked?).to eq(false)
    end
  end

  context '#mark_center' do
    let(:center_marked_board) { Board.new }

    it 'marks the center' do
      center_marked_board.mark_center('X')
      expect(center_marked_board.center_marked?).to eq(true)
    end
  end

  context '#available_spots' do
    it 'should return the available spots' do
      expect(board_valid_row.available_spots).to contain_exactly('3', '4', '5', '6', '7', '8')

      expect(board_valid_column.available_spots).to contain_exactly('1', '2', '4', '5', '7', '8')

      expect(board_valid_diagonal.available_spots).to contain_exactly('1', '2', '3', '5', '6', '7')
    end
  end

  context '#game_over?' do
    it 'has no valid rows' do
      expect(board.game_over?).to eq(false)
    end

    it 'has a valid row' do
      expect(board_valid_row.game_over?).to eq(true)
    end

    it 'has a valid column' do
      expect(board_valid_column.game_over?).to eq(true)
    end

    it 'has a valid diagonal' do
      expect(board_valid_diagonal.game_over?).to eq(true)
    end
  end

  context '#tie?' do
    let(:tied_board) { Board.new }

    it 'is not a tie' do
      expect(board.tie?).to eq(false)
    end

    it 'has a valid row' do
      expect(board_valid_row.tie?).to eq(false)
    end

    it 'has a valid column' do
      expect(board_valid_column.tie?).to eq(false)
    end

    it 'has a valid diagonal' do
      expect(board_valid_row.tie?).to eq(false)
    end

    #    it 'is tied' do
    #      # X | O | X
    #      # O | O | X
    #      # X | X | O
    #      #
    #      # The method checks for colored input. x_marker and o_marker are there so i dont need to include the Color module.
    #      x_marker = "\e[32mX\e[0m"
    #      o_marker = "\e[34mO\e[0m"
    #
    #      tied_board.grid.spot_marker(0, x_marker)
    #      tied_board.grid.spot_marker(1, o_marker)
    #      tied_board.grid.spot_marker(2, x_marker)
    #      tied_board.grid.spot_marker(3, o_marker)
    #      tied_board.grid.spot_marker(4, o_marker)
    #      tied_board.grid.spot_marker(5, x_marker)
    #      tied_board.grid.spot_marker(6, x_marker)
    #      tied_board.grid.spot_marker(7, x_marker)
    #      tied_board.grid.spot_marker(8, o_marker)
    #
    #      expect(tied_board.tie?).to be_truthy
    #    end
  end
end
