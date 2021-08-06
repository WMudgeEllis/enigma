class Shift
  attr_reader :shifts

  def initialize(cript_key, date)
    @shifts= {a: 0, b: 0, c: 0, d: 0}
    @cript_key = cript_key
    @date = date.to_i
  end

  def generate_shift_nums
    @shifts.each do |sym, shift|
      @shifts[sym] += process_key(sym).to_i
      @shifts[sym] += process_offset(sym)
    end
  end

  def process_key(key)
    return @cript_key[0..1] if key == :a
    return @cript_key[1..2] if key == :b
    return @cript_key[2..3] if key == :c
    return @cript_key[3..4] if key == :d
  end

  def process_offset(key)
    return squared_last_4[0].to_i if key == :a
    return squared_last_4[1].to_i if key == :b
    return squared_last_4[2].to_i if key == :c
    return squared_last_4[3].to_i if key == :d
  end

  def squared_last_4
    squared = @date * @date
    squared.to_s[-4..-1]
  end
end
