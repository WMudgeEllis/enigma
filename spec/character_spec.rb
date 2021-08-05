require "simplecov"
require "./lib/character"

SimpleCov.start
RSpec.describe Character do

  it 'exists and has attributes' do
    character = Character.new

    expect(character).to be_a(Character)
    expect(character.set.length).to eq(27)
  end

  it 'can encrypt' do
    character = Character.new

    expect(character.encrypt('a', 1)).to eq('b')
    expect(character.encrypt('b', 7)).to eq('i')
    expect(character.encrypt('z', 0)).to eq('z')
    expect(character.encrypt('a', 35)).to eq('i')
    expect(character.encrypt(' ', 27)).to eq(' ')
  end

  it 'can decrypt' do
    character = Character.new

    expect(character.decrypt('a', 1)).to eq('z')
    expect(character.decrypt('b', 7)).to eq('v')
    expect(character.decrypt('z', 0)).to eq('z')
    expect(character.decrypt('a', 35)).to eq('v')
    expect(character.decrypt('0', 27)).to eq(' ')
  end

end
