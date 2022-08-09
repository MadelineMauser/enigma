require 'pry'
require 'date'
require './lib/shiftable'
require './lib/encryption'
class Enigma
  include Shiftable
  def initialize
    @encryption = Encryption.new
  end

  def encrypt(message, key = random_key, date = Date.today.strftime('%d%m%y'))
    @encryption.encrypt(message, key, date)
  end

  def decrypt(message, key, date = Date.today.strftime('%d%m%y'))
    
  end

  def random_key
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].sample(5).join
  end
end
