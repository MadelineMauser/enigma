require './spec/spec_helper'
require './lib/shiftable'

RSpec.describe Shiftable do
  describe '#shifts' do
    it 'can create an array of shifts' do
      expect(Shiftable.shifts('02715', '040895')).to eq([3, 27, 73, 20])
    end
  end
end
