require "simplecov"
require "./lib/enigma"
require 'date'

SimpleCov.start
RSpec.describe Enigma do

  it 'exists and can do mocked/stubbed methods' do
    enigma = Enigma.new

    allow(enigma.clas).to receive(:some_method).and_return("keder ohulw")
    allow(enigma.other_clas).to receive(:some_other_method).and_return("hello world")

    expect(enigma).to be_a(Enigma)
    expect(enigma.encrypt("hello world", "02715", "040895")). to eq({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      })
    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq({
      decryption: "hello world",
      key: "02715",
      date: "040895"
      })
  end

  it 'can generate random numbers' do
    enigma = Enigma.new

    expect(enigma.random_generator.length).to eq(5)
    expect(enigma.random_generator).to be_a(String)
  end

  it "can generate today's date" do
    enigma = Enigma.new

    expect(enigma.date_generator).to eq("050821")
  end

  it "can function without all arguments" do
    enigma = Enigma.new

    allow(enigma.clas).to receive(:some_method).and_return("keder ohulw")
    allow(enigma.other_clas).to receive(:some_other_method).and_return("hello world")
    allow(enigma).to receive(:random_generator).and_return("02715")
    allow(enigma).to receive(:date_generator).and_return("040895")


    expect(enigma.encrypt("hello world")). to eq({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      })
    expect(enigma.decrypt("keder ohulw", "02715")).to eq({
      decryption: "hello world",
      key: "02715",
      date: "040895"
      })
  end

end
