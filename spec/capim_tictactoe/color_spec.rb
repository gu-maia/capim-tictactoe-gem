# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe Color do
  let(:dummy_class) { Class.new { extend Color } }

#  it 'should print a red pipe' do
#    expect(dummy_class.pipe).to eq("\e[31m | \e[0m")
#  end
#  it 'should print a line' do
#    expect(dummy_class.line).to eq("\e[31m\n---+---+---\n\e[0m")
#  end
#  it 'should print the X marker' do
#    expect(dummy_class.x_marker).to eq("\e[32mX\e[0m")
#  end
#  it 'should print the O marker' do
#    expect(dummy_class.o_marker).to eq("\e[34mO\e[0m")
#  end
end
