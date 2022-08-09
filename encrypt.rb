require './lib/enigma'

enigma = Enigma.new

encryption = enigma.encrypt(File.read(ARGV[0]).chomp)
