require 'pry'
class Enigma
  def initialize
    @characer_set = ("a".."z").to_a << " "
  end

  def encrypt(message, key, date)
    encryption = ''
    working_index = 0
    message.downcase.split('').each do |character|
      current_shift = shifts(key, date)[working_index % 4]
      char_index = @characer_set.find_index(character)
      encryption.concat(@characer_set[(char_index + current_shift) % 27])
      working_index += 1
    end
    {encryption: encryption, key: key, date: date}
  end

  def shifts(key, date)
    a_key = key[0, 2]
    b_key = key[1, 2]
    c_key = key[2, 2]
    d_key = key[3, 2]

    date_offset = ((date.to_i) * (date.to_i)).to_s[-4..-1]
    a_offset = date_offset[0]
    b_offset = date_offset[1]
    c_offset = date_offset[2]
    d_offset = date_offset[3]

    a_shift = a_key.to_i + a_offset.to_i
    b_shift = b_key.to_i + b_offset.to_i
    c_shift = c_key.to_i + c_offset.to_i
    d_shift = d_key.to_i + d_offset.to_i

    [a_shift, b_shift, c_shift, d_shift]
  end
end
