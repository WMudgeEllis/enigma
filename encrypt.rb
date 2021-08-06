
enigma = Enigma.new
File.open(ARGV[0], 'r').read

enigma.encrypt(File.open(ARGV[0], 'r').read, "02715", "040895")
