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

    expect(crypt.attach_shift_nums).to eq([
      {'h' => 3},
      {'e' => 27},
      {'l' => 73},
      {'l' => 20},
      {'o' => 3},
      {' ' => 27},
      {'w' => 73},
      {'o' => 20},
      {'r' => 3},
      {'l' => 27},
      {'d' => 73}
      ])
  end

  it 'can encrypt' do
    crypt = Crypt.new("hello world", "02715", "040895")

     expect(crypt.encrypt).to eq("keder ohulw")
  end

  it 'can decrypt' do
    crypt = Crypt.new("keder ohulw", "02715", "040895")

    expect(crypt.decrypt).to eq("hello world")
  end

end
