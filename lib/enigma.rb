require 'pry'
class Enigma
  def initialize
    @characer_set = ("a".."z").to_a << " "
  end

  def encrypt(message, key, date)
    key = key
    a_key = key[0, 2]
    b_key = key[1, 2]
    c_key = key[2, 2]
    d_key = key[3, 2]
binding.pry
  end
end
