require "./lib/enigma"

class Runner
  attr_reader :read_file_location,
              :write_file_location,
              :key,
              :date,
              :encrypt_info,
              :decrypt_info

  def initialize(read_file_location, write_file_location, key = nil, date = nil)
    @read_file_location = read_file_location
    @write_file_location = write_file_location
    @key = key
    @date = date
    @encrypt_info = Enigma.new.encrypt(read_file)
    @decrypt_info = Enigma.new.decrypt(read_file, @key, @date) if @key != nil
  end

  def read_file
    file = File.open(@read_file_location, 'r')
    contents = file.read
    file.close

    contents.delete("\n")
  end

  def write(enigma_result)
    File.open(@write_file_location, 'w') { |file| file.write(enigma_result) }
  end

  def encrypt
    write(@encrypt_info[:encryption])
    "Created '#{write_file_location}' with the key #{@encrypt_info[:key]} and date #{@encrypt_info[:date]}"
  end

  def decrypt
    write(@decrypt_info[:decryption])
    "Created '#{write_file_location}' with the key #{@decrypt_info[:key]} and date #{@decrypt_info[:date]}"
  end
end
