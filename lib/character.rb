class Character
  attr_reader :set

  def initialize
    @set = ('a'..'z').to_a << ' '
  end

  def encrypt(letter, shift)
    return letter if !@set.include?(letter)
    #may want to include % somewhere
    make_first(letter).rotate(shift).first
  end

  def decrypt(letter, shift)
    return letter if !@set.include?(letter)
    #may want to include % somewhere
    make_first(letter).rotate(shift * -1).first
  end

  def make_first(letter)
    @set.rotate(@set.find_index(letter)) if @set.include?(letter)
  end

end
