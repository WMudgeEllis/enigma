require 'simplecov'
SimpleCov.start
require './lib/fileinteractor'

RSpec.describe FileInteractor do

  it 'can take an argument and spit them back' do
    file_interactor1 = file_interactor.new('data/message.txt', 'data/encrypted.txt')
    file_interactor2 = file_interactor.new('data/encrypted.txt', 'data/decrypted.txt', "02715", "040895")

    expect(file_interactor1.read_file_location).to eq('data/message.txt')
    expect(file_interactor1.write_file_location).to eq('data/encrypted.txt')
    expect(file_interactor2.read_file_location).to eq('data/encrypted.txt')
    expect(file_interactor2.write_file_location).to eq('data/decrypted.txt')
    expect(file_interactor2.key).to eq("02715")
    expect(file_interactor2.date).to eq("040895")
  end

  it 'can write files' do
    file_interactor2 = file_interactor.new('data/encrypted.txt', 'data/decrypted.txt', "02715", "040895")

    file_interactor2.write('hello world')

    expect(File.open('data/decrypted.txt', 'r').read).to eq('hello world')

    File.open('data/decrypted.txt', 'w') { |file| file.write('') }
  end

  it 'can read files' do
    file_interactor1 = FileInteractor.new('data/message.txt', 'data/encrypted.txt')
    file_interactor2 = FileInteractor.new('data/encrypted.txt', 'data/decrypted.txt', "02715", "040895")

    File.open('data/message.txt', 'w') { |file| file.write('hello world') }
    File.open('data/encrypted.txt', 'w') { |file| file.write('keder ohulw') }

    expect(file_interactor1.read_file).to eq('hello world')
    expect(file_interactor2.read_file).to eq('keder ohulw')

    File.open('data/message.txt', 'w') { |file| file.write('') }
    File.open('data/encrypted.txt', 'w') { |file| file.write('') }
  end

  it 'can encrypt' do
    File.open('data/message.txt', 'w') { |file| file.write('hello world') }

    file_interactor = FileInteractor.new('data/message.txt', 'data/encrypted.txt')
    key = file_interactor.encrypt_info[:key]
    date = file_interactor.encrypt_info[:date]

    expect(file_interactor.encrypt).to eq("Created 'data/encrypted.txt' with the key #{key} and date #{date}")

    expected = File.open('data/encrypted.txt', 'r').read
    expect(File.open('data/encrypted.txt', 'r').read).to eq(expected)

    File.open('data/message.txt', 'w') { |file| file.write('') }
    File.open('data/encrypted.txt', 'w') { |file| file.write('') }
  end

  it 'can decrypt'do
    File.open('data/encrypted.txt', 'w') { |file| file.write('keder ohulw') }

    file_interactor = FileInteractor.new('data/encrypted.txt', 'data/decrypted.txt', "02715", "040895")

    expect(file_interactor.decrypt).to eq("Created 'data/decrypted.txt' with the key 02715 and date 040895")
    expect(File.open('data/decrypted.txt', 'r').read).to eq('hello world')


    File.open('data/encrypted.txt', 'w') { |file| file.write('') }
    File.open('data/decrypted.txt', 'w') { |file| file.write('') }
  end
end
