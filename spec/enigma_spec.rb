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
    expect(@enigma.encrypt('Hello world', '02715', '040895')).to eq({encryption: 'keder ohulw', key: '02715', date: '040895'})
  end
end
describe '#shifts' do
  it 'can create an array of shifts' do
    expect(@enigma.shifts('02715', '040895')).to eq([3, 27, 73, 20])
  end
end
describe '#decrypt' do
  it 'can decrypt a given string with a given key and date' do
    expect(@enigma.decrypt('keder ohulw', '02715', '040895')).to eq({decryption: 'hello world', key: '02715', date: '040895'})
  end
end
end
