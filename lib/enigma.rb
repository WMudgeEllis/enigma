class Enigma
  attr_reader :clas

  def initialize
    @clas = []

  end


def encrypt(message, key = random_generator, date = date_generator)
  {
    encryption: @clas.some_method(message, key, date),
    key: key,
    date: date
  }

end


end
