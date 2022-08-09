require './lib/enigma'

enigma = Enigma.new

decryption = enigma.decrypt(File.read(ARGV[0]).chomp, ARGV[2], ARGV[3])

new_file = File.open(ARGV[1], 'w')
new_file.write(decryption[:decryption])

puts "Created '#{ARGV[1]}' with the key #{decryption[:key]} and date #{decryption[:date]}"
