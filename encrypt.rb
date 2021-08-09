require './lib/runner'
require "./lib/enigma"
require "./lib/crypt"
require "./lib/shift"
require "./lib/character"
require "date"

File.open('data/message.txt', 'w') { |file| file.write('hello world') }

puts FileInteractor.new(ARGV[0], ARGV[1]).encrypt
