require './lib/enigma'

RSpec.describe Enigma do
before :all do
  @enigma = Enigma.new
end
describe 'Enigma instantiation' do
  it 'exists' do
    expect(@enigma).to be_an_instance_of(Enigma)
  end
end
end
