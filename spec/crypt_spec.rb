require "simplecov"
SimpleCov.start
require "./lib/crypt"
require './lib/character'


RSpec.describe Crypt do

  it 'exists and can pre process a string' do
    crypt = Crypt.new("hello world", "02715", "040895")

    expect(crypt.shifts).to eq({a: 3, b: 27, c: 73, d: 20})
    expect(crypt.character).to be_a(Character)
    expect(crypt.pre_process).to eq(['h', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd'])
  end

  it 'attaches shift keys to letters' do
    crypt1 = Crypt.new("hello world", "02715", "040895")
    crypt2 = Crypt.new("HELLO WORLD", "02715", "040895")

    expect(crypt1.attach_shift_nums).to eq([
      ['h', 3],
      ['e', 27],
      ['l', 73],
      ['l', 20],
      ['o', 3],
      [' ', 27],
      ['w', 73],
      ['o', 20],
      ['r', 3],
      ['l', 27],
      ['d', 73]
    ])
    expect(crypt2.attach_shift_nums).to eq([
      ['h', 3],
      ['e', 27],
      ['l', 73],
      ['l', 20],
      ['o', 3],
      [' ', 27],
      ['w', 73],
      ['o', 20],
      ['r', 3],
      ['l', 27],
      ['d', 73]
    ])
  end

  it 'can encrypt' do
    crypt1 = Crypt.new("hello world", "02715", "040895")
    crypt2 = Crypt.new("hello world!", "02715", "040895")

     expect(crypt1.encrypt).to eq("keder ohulw")
     expect(crypt2.encrypt).to eq("keder ohulw!")
  end

  it 'can decrypt' do
    crypt1 = Crypt.new("keder ohulw", "02715", "040895")
    crypt2 = Crypt.new("keder ohulw!", "02715", "040895")

    expect(crypt1.decrypt).to eq("hello world")
    expect(crypt2.decrypt).to eq("hello world!")
  end

end
