require "./enigma"

class Runner
  attr_reader :read_file_location, :write_file_location, :key, :date


  def initialize(read_file_location, write_file_location, key = nil, date = nil)
    @read_file_location = read_file_location
    @write_file_location = write_file_location
    @key = key
    @date = date
  end

  def read_file
    file = File.open(read_file_location, 'r')
    contents = file.read
    file.close
    #may cause issues maybe change to a delete?
    contents
  end

  def write(enigma_result)
    File.open(write_file_location, 'w') { |file| file.write(enigma_result) }
  end

end
