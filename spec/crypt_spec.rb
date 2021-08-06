require "simplecov"
require "./lib/crypt"
require './lib/character'


SimpleCov.start
RSpec.describe Crypt do

  it 'exists and can pre process a string' do
    crypt = Crypt.new("hello world", "02715", "040895")

    expect(crypt.shifts).to eq({a: 3, b: 27, c: 73, d: 20})
    expect(crypt.character).to be_a(Character)
    expect(crypt.pre_process).to eq(['h', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd'])
  end

  it 'attaches shift keys to letters' do
    crypt = Crypt.new("hello world", "02715", "040895")

    expect(crypt.attach_shift_keys).to eq([
      {a: 'h'},
      {b: 'e'},
      {c: 'l'},
      {d: 'l'},
      {a: 'o'},
      {b: ' '},
      {c: 'w'},
      {d: 'o'},
      {a: 'r'},
      {b: 'l'},
      {c: 'd'}
      ])
  end

end
