# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe Presenter do
  it 'should declare the constants' do
    expect(Presenter::SILLY_LINE).to be_a(String)
    expect(Presenter::GREEN_GRASS).to be_a(String)

    expect(SillyLine::LINES).to include(Presenter::SILLY_LINE)
    expect(Presenter::GREEN_GRASS).to eq(AsciiArt::GREEN_GRASS)
  end
end
