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
    decryption = ''
    working_index = 0
    message.downcase.split('').each do |character|
      if @characer_set.any?(character)
        current_shift = Shiftable.shifts(key, date)[working_index % 4]
        char_index = @characer_set.find_index(character)
        decryption.concat(@characer_set[(char_index - current_shift) % 27])
        working_index += 1
      else
        decryption.concat(character)
      end
    end
    {decryption: decryption, key: key, date: date}
  end

  def random_key
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].sample(5).join
  end
end
