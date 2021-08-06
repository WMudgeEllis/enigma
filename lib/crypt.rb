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

  def attach_shift_nums
    processed_letters = []
    count = 0
    pre_process.each do |letter|

      if count % 4 == 0
        processed_letters << {letter => @shifts[:a]}
      elsif count == 1 || ((count - 1) % 4 == 0 )
        processed_letters << {letter => @shifts[:b]}
      elsif count == 2 || ((count - 2) % 4 == 0 )
        processed_letters << {letter => @shifts[:c]}
      elsif count == 3 || ((count - 3) % 4 == 0 )
        processed_letters << {letter => @shifts[:d]}
      end

      count += 1
    end
    processed_letters
  end
end
