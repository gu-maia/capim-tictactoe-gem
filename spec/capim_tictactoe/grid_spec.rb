# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe Grid do
  let(:grid_instance) { Grid.new }

  before do
    # X | X | X
    # Y | Y | Y
    # Z | Z | Z
    grid_instance.spot_marker(0, 'X')
    grid_instance.spot_marker(1, 'X')
    grid_instance.spot_marker(2, 'X')
    grid_instance.spot_marker(3, 'Y')
    grid_instance.spot_marker(4, 'Y')
    grid_instance.spot_marker(5, 'Y')
    grid_instance.spot_marker(6, 'Z')
    grid_instance.spot_marker(7, 'Z')
    grid_instance.spot_marker(8, 'Z')
  end
  it 'should create the grid' do
    expect(subject.grid).to eq(%w[0 1 2 3 4 5 6 7 8])
  end

  context '#get_at' do
    it 'should get the value at a point' do
      spot = subject.grid.sample.to_i

      expect(subject.get_at(spot)).to eq(subject.grid[spot])
    end
  end

  context '#rows' do
    let(:grid) { %w[0 1 2 3 4 5 6 7 8] }
    it 'receives a set of spots as a parameter' do
      expect(subject.rows(grid).to_a).to eq([%w[0 1 2], %w[3 4 5], %w[6 7 8]])
    end

    it 'does not receive a set of spots and uses instanced values' do
      expect(grid_instance.rows.to_a).to eq([%w[X X X], %w[Y Y Y], %w[Z Z Z]])
    end
  end

  context 'columns' do
    let(:grid) { %w[0 1 2 3 4 5 6 7 8] }

    it 'receives a set of spots and transposes the rows' do
      expect(subject.columns(grid).to_a).to eq([%w[0 3 6], %w[1 4 7], %w[2 5 8]])
    end
  end

  context 'diagonals' do
    it 'returns the diagonals' do
      expect(grid_instance.diagonals).to eq([%w[X Y Z], %w[X Y Z]])
    end
  end

  context '#spot_marker' do
    let(:grid) { Grid.new }
    it 'should mark spots' do
      # checking that a random spot has the default value
      spot = grid.grid.sample.to_i
      expect(grid.get_at(spot)).to eq(spot.to_s)

      # checking if it is now marked
      grid.spot_marker(spot, 'MARKED')
      expect(grid.get_at(spot)).to eq('MARKED')
    end
  end

  #  context '#marked?' do
  #    let(:grid) { Grid.new }
  #    human_marker = "\e[34mO\e[0m"
  #
  #    it 'should verify if a spot is marked' do
  #      # checking that a random spot has the default value
  #      spot = grid.grid.sample.to_i
  #      expect(grid.get_at(spot)).to eq(spot.to_s)
  #
  #      # checking if it is now marked
  #      grid.spot_marker(spot, human_marker)
  #      expect(grid.marked?(spot)).to eq(true)
  #    end
  #  end
end
