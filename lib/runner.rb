class Runner
  attr_reader :read_file_location, :write_file_location, :key, :date


  def initialize(read_file_location, write_file_location, key = nil, date = nil)
    @read_file_location = read_file_location
    @write_file_location = write_file_location
    @key = key
    @date = date
  end


end
