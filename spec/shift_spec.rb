require "simplecov"
SimpleCov.start

require "./lib/shift"

RSpec.describe Shift do

  it 'exists and has attributes' do
    shift = Shift.new("02715", "040895")

    expect(shift.shifts).to eq({a: 0, b: 0, c: 0, d: 0})
  end

  it 'can generate generate final shift' do
    shift = Shift.new("02715", "040895")

    shift.generate_shift_nums

    expect(shift.shifts).to eq({a: 3, b: 27, c: 73, d: 20})
  end

  it 'can process key' do
    shift = Shift.new("02715", "040895")

    expect(shift.process_key(:a)).to eq("02")
    expect(shift.process_key(:b)).to eq("27")
    expect(shift.process_key(:c)).to eq("71")
    expect(shift.process_key(:d)).to eq("15")
  end

  it 'can process offset' do
    shift = Shift.new("02715", "040895")

    expect(shift.squared_last_4).to eq("1025")
    expect(shift.process_offset(:a)).to eq(1)
    expect(shift.process_offset(:b)).to eq(0)
    expect(shift.process_offset(:c)).to eq(2)
    expect(shift.process_offset(:d)).to eq(5)
  end
end
