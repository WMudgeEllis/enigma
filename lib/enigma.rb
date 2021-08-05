class Enigma
  attr_reader :clas, :other_clas

  def initialize
    @clas = []
    @other_clas =[]

  end


def encrypt(message, key = random_generator, date = date_generator)
  { encryption: @clas.some_method(message, key, date),
    key: key,
    date: date
  }

end

def decrypt(ciphertext, key, date = date_generator)
  { decryption: @other_clas.some_other_method(ciphertext, key, date),
    key: key,
    date: date
  }
end

def random_generator

end

def date_generator

end


end
