class Encryption

  def encrypt(message, key = random_key, date = Date.today.strftime('%d%m%y'))
    encryption = ''
    working_index = 0
    message.downcase.split('').each do |character|
      if @characer_set.any?(character)
        current_shift = Shiftable.shifts(key, date)[working_index % 4]
        char_index = @characer_set.find_index(character)
        encryption.concat(@characer_set[(char_index + current_shift) % 27])
        working_index += 1
      else
        encryption.concat(character)
      end
    end
    {encryption: encryption, key: key, date: date}
  end
end
