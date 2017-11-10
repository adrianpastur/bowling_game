require 'bowling'

  # before :each do
  #   bowling = Bowling.new ('Adrian')
  # end
describe 'the game' do
  it 'has one player'do
  bowling = Bowling.new ('Adrian')
    expect(bowling.player).to eq('Adrian')
  end
end

describe 'score' do
  before :each do
    bowling = Bowling.new ('Adrian')
  end
  it 'one instance for every player'
  it 'calculates total score'
  it 'handles spares'
  it 'handles strikes'
  it 'can be saved'
end

describe 'user input' do
  before :each do
    bowling = Bowling.new ('Adrian')
  end
  it 'can be modified'
  it 'takes user input for every line'
  it 'is restricted to 10 turns'
  it 'has two triest per turn'
end
