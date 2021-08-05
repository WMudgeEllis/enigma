class Character
  attr_reader :set

  def initialize
    @set = ('a'..'z').to_a << ' '
  end

  def encrypt(letter, shift)
    make_first(letter).rotate(shift).first
  end

  def decrypt(letter, shift)
    make_first(letter).rotate(shift * -1).first
  end

  def make_first(letter)
    @set.rotate(@set.find_index(letter))
  end

end
