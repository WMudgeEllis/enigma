require './lib/runner'
require "./lib/enigma"
require "./lib/crypt"
require "./lib/shift"
require "./lib/character"
require "date"

puts Runner.new(ARGV[0], ARGV[1], ARGV[2], ARGV[3]).decrypt
