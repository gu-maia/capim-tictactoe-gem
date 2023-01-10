# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe SillyLine do
  describe 'LINES' do
    it { should be_const_defined(:LINES) }
    it 'should be frozen' do
      expect(SillyLine::LINES).to be_frozen
    end
  end
end
