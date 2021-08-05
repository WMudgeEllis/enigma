class Character
  attr_reader :set

  def initialize
    @set = ('a'..'z').to_a << ' '
  end


end
