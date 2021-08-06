require 'simplecov'
require './lib/runner'

SimpleCov.start
RSpec.describe Runner do

  it 'can take an argument and spit them back' do
    runner1 = Runner.new('data/message.txt', 'data/encrypted.txt')
    runner2 = Runner.new('data/encrypted.txt', 'data/decrypted.txt', "02715", "040895")

    expect(runner1.read_file_location).to eq('data/message.txt')
    expect(runner1.write_file_location).to eq('data/encrypted.txt')
    expect(runner2.read_file_location).to eq('data/encrypted.txt')
    expect(runner2.write_file_location).to eq('data/decrypted.txt')
    expect(runner2.key).to eq("02715")
    expect(runner2.date).to eq("040895")
  end

  it 'can write files' do
    runner2 = Runner.new('data/encrypted.txt', 'data/decrypted.txt', "02715", "040895")

    runner2.write('hello world')

    expect(File.open('data/decrypted.txt', 'r').read).to eq('hello world')

    File.open('data/decrypted.txt', 'w') { |file| file.write('') }
  end

  it 'can read files' do
    runner1 = Runner.new('data/message.txt', 'data/encrypted.txt')
    runner2 = Runner.new('data/encrypted.txt', 'data/decrypted.txt', "02715", "040895")

    File.open('data/message.txt', 'w') { |file| file.write('hello world') }
    File.open('data/encrypted.txt', 'w') { |file| file.write('keder ohulw') }

    expect(runner1.read_file).to eq('hello world')
    expect(runner2.read_file).to eq('keder ohulw')

    File.open('data/message.txt', 'w') { |file| file.write('') }
    File.open('data/encrypted.txt', 'w') { |file| file.write('') }
  end

  xit 'can encrypt' do
    runner = Runner.new('data/message.txt', 'data/encrypted.txt')

    expect(runner.encrypt("hello world")).to eq("Created 'encrypted.txt' with the key 82648 and date 240818")
  end
end



#want it to spit out 'i have created file location' the key is key and the date is date
#want it to write those text files
