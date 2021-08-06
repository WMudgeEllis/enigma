class Enigma

  def encrypt(message, key = random_generator, date = date_generator)
    { encryption: Crypt.new(message, key, date).encrypt,
      key: key,
      date: date
    }
  end

  def decrypt(ciphertext, key, date = date_generator)
    { decryption: Crypt.new(ciphertext, key, date).decrypt,
      key: key,
      date: date
    }
  end

  def random_generator
    "%05d" % rand(0...100000)
  end

  def date_generator
    Date.today.strftime("%d%m%y")
  end


end
