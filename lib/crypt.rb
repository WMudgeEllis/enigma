class Crypt
  attr_reader :shifts, :character

  def initialize(data_string, key, date)
    @data_string = data_string
    @shifts = Shift.new(key, date).generate_shift_nums
    @character = Character.new
  end

  def pre_process
    @data_string.split('')
  end


end
