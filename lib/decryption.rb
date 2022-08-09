class Decryption
  def initialize
    @character_set = ("a".."z").to_a << " "
  end
  def decrypt(message, key, date = Date.today.strftime('%d%m%y'))
    decryption = ''
    working_index = 0
    message.downcase.split('').each do |character|
      if @character_set.any?(character)
        current_shift = Shiftable.shifts(key, date)[working_index % 4]
        char_index = @character_set.find_index(character)
        decryption.concat(@character_set[(char_index - current_shift) % 27])
        working_index += 1
      else
        decryption.concat(character)
      end
    end
    {decryption: decryption, key: key, date: date}
  end
end
