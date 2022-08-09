class Encryption
  def initialize
    @character_set = ("a".."z").to_a << " "
  end
  def encrypt(message, key, date)
    encryption = ''
    working_index = 0
    message.downcase.split('').each do |character|
      if @character_set.any?(character)
        current_shift = Shiftable.shifts(key, date)[working_index % 4]
        char_index = @character_set.find_index(character)
        encryption.concat(@character_set[(char_index + current_shift) % 27])
        working_index += 1
      else
        encryption.concat(character)
      end
    end
    {encryption: encryption, key: key, date: date}
  end
end
