require_relative '../spec_helper'

RSpec.describe AsciiArt do

  it 'should be a constant' do
    expect(AsciiArt::GRASS).to be_a(String)
    expect(AsciiArt::GREEN_GRASS).to be_a(String)
  end

  it 'should have the correct value' do
    expect(AsciiArt::GREEN_GRASS).to eq(Rainbow(AsciiArt::GRASS).green)
  end
end
