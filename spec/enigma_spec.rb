require './spec/spec_helper'
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
    expect(@enigma.encryption.encrypt('Hello world', '02715', '040895')).to eq({encryption: 'keder ohulw', key: '02715', date: '040895'})
  end
  it 'can encrypt a given string with a given key and default date' do
    expect(@enigma.encrypt('Hello world', '02715')).to be_a(Hash)
    expect(@enigma.encrypt('Hello world', '02715').count).to eq(3)
    expect(@enigma.encrypt('Hello world', '02715')[:key]).to eq('02715')
    expect(@enigma.encrypt('Hello world', '02715')[:date]).to eq(Date.today.strftime('%d%m%y'))
    expect(@enigma.encrypt('Hello world', '02715')[:encryption]).to be_a(String)
    expect(@enigma.encrypt('Hello world', '02715')[:encryption]).not_to eq('Hello world')
  end
  it 'can encrypt a given string with a generated key and default date' do
    expect(@enigma.encrypt('Hello world')).to be_a(Hash)
    expect(@enigma.encrypt('Hello world').count).to eq(3)
    expect(@enigma.encrypt('Hello world')[:key]).to be_a(String)
    expect(@enigma.encrypt('Hello world')[:date]).to eq(Date.today.strftime('%d%m%y'))
    expect(@enigma.encrypt('Hello world')[:encryption]).to be_a(String)
    expect(@enigma.encrypt('Hello world')[:encryption]).not_to eq('Hello world')
  end
  it 'can encrypt a string with special characters' do
    expect(@enigma.encrypt('Hello world!', '02715', '040895')).to eq({encryption: 'keder ohulw!', key: '02715', date: '040895'})
  end
end
describe '#decrypt' do
  it 'can decrypt a given string with a given key and date' do
    expect(@enigma.decrypt('keder ohulw', '02715', '040895')).to eq({decryption: 'hello world', key: '02715', date: '040895'})
  end
  it 'can decrypt a given string with a given key and default date' do
    encrypted_string = @enigma.encrypt('Hello world', '02715')[:encryption]
    expect(@enigma.decrypt(encrypted_string, '02715')).to eq({decryption: 'hello world', key: '02715', date: Date.today.strftime('%d%m%y')})
  end
  it 'can decrypt a string with special characters' do
    expect(@enigma.decrypt('keder ohulw!', '02715', '040895')).to eq({decryption: 'hello world!', key: '02715', date: '040895'})
  end
end
describe '#random_key' do
  it 'can create a string of five random numbers' do
    expect(@enigma.random_key).to be_a(String)
    expect(@enigma.random_key.length).to eq(5)
    expect(@enigma.random_key.to_i).not_to be(nil)
  end
end
end
