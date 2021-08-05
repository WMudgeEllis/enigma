require "simplecov"
require "./lib/enigma"

SimpleCov.start
RSpec.describe Enigma do

  it 'exists and can do mocked/stubbed methods' do
    enigma = Enigma.new

    allow(enigma.clas).to receive(:some_method).and_return("keder ohulw")

    expect(enigma).to be_a(Enigma)
    expect(enigma.encrypt("hello world", "02715", "040895")). to eq({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      })
  end





end
