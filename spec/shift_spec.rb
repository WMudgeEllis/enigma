require "simplecov"


SimpleCov.start
RSpec.describe Shift do

  it 'exists and has attributes' do
    shift = Shift.new("02715", "040895")

    expect(shift.a).to eq(0)
    expect(shift.b).to eq(0)
    expect(shift.c).to eq(0)
    expect(shift.d).to eq(0)
  end





end
