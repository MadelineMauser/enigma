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
describe '#encrypt' do
  it 'can encrypt a given string with a given key and date' do
    expect(@enigma.encrypt('Hello world', '040895', '040895')).to eq({encryption: 'keder ohulw', key: '040895', date: '040895'})
  end
end
end
