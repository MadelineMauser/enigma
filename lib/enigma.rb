require 'pry'
require 'date'
class Enigma
  def initialize
    @characer_set = ("a".."z").to_a << " "
  end

  def encrypt(message, key = random_key, date = Date.today.strftime('%d%m%y'))
    encryption = ''
    working_index = 0
    message.downcase.split('').each do |character|
      if @characer_set.any?(character)
        current_shift = shifts(key, date)[working_index % 4]
        char_index = @characer_set.find_index(character)
        encryption.concat(@characer_set[(char_index + current_shift) % 27])
        working_index += 1
      else
        encryption.concat(character)
      end
    end
    {encryption: encryption, key: key, date: date}
  end

  def decrypt(message, key, date = Date.today.strftime('%d%m%y'))
    decryption = ''
    working_index = 0
    message.downcase.split('').each do |character|
      if @characer_set.any?(character)
        current_shift = shifts(key, date)[working_index % 4]
        char_index = @characer_set.find_index(character)
        decryption.concat(@characer_set[(char_index - current_shift) % 27])
        working_index += 1
      else
        decryption.concat(character)
      end
    end
    {decryption: decryption, key: key, date: date}
  end

  def shifts(key, date)
    date_offset = ((date.to_i) * (date.to_i)).to_s[-4..-1]
    a_shift = key[0, 2].to_i + date_offset[0].to_i
    b_shift = key[1, 2].to_i + date_offset[1].to_i
    c_shift = key[2, 2].to_i + date_offset[2].to_i
    d_shift = key[3, 2].to_i + date_offset[3].to_i
    [a_shift, b_shift, c_shift, d_shift]
  end

  def random_key
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].sample(5).join
  end
end
