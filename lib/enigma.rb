require 'pry'
require 'date'
require './lib/shiftable'
require './lib/encryption'
require './lib/decryption'
class Enigma
  include Shiftable
  def initialize
    @encryption = Encryption.new
    @decryption = Decryption.new
  end

  def encrypt(message, key = random_key, date = Date.today.strftime('%d%m%y'))
    @encryption.encrypt(message, key, date)
  end

  def decrypt(message, key, date = Date.today.strftime('%d%m%y'))
    @decryption.decrypt(message, key, date)
  end

  def random_key
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].sample(5).join
  end
end
