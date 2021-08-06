require 'simplecov'
require './lib/runner'

SimpleCov.start
RSpec.describe Runner do

  it 'can take an argument and spit them back' do
    runner1 = Runner.new('data/message.txt', 'data/encrypted.txt')
    runner2 = Runner.new('data/encrypted.txt', 'data/decrypted', "02715", "040895")

    expect(runner1.read_file_location).to eq('data/message.txt')
    expect(runner1.write_file_location).to eq('data/encrypted.txt')
    expect(runner2.read_file_location).to eq('data/encrypted.txt')
    expect(runner2.write_file_location).to eq('data/decrypted')
    expect(runner2.key).to eq("02715")
    expect(runner2.date).to eq("040895")
  end

  it 'can read files' do
    runner1 = Runner.new('data/message.txt', 'data/encrypted.txt')
    runner2 = Runner.new('data/encrypted.txt', 'data/decrypted', "02715", "040895")

    expect(runner1.read_file).to eq('hello world')
    expect(runner2.read_file).to eq('keder ohulw')

  end

  xit 'can encrypt' do
    runner = Runner.new('data/message.txt', 'data/encrypted.txt')

    expect(runner.encrypt("hello world").to eq("Created 'encrypted.txt' with the key 82648 and date 240818")
  end
end



#want it to spit out 'i have created file location' the key is key and the date is date
#want it to write those text files
