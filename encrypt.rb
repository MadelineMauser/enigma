require './lib/enigma'

enigma = Enigma.new

encryption = enigma.encrypt(File.read(ARGV[0]).chomp)

new_file = File.open(ARGV[1], 'w')
new_file.write(encryption[:encryption])

puts "Created '#{ARGV[1]}' with the key #{encryption[:key]} and date #{encryption[:date]}"
