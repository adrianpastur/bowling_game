require 'bowling'
require 'spec_helper'

describe Bowling do
  describe 'the game' do

 #get an error here if i remove every bowling = Bowling.new line as recommended after the tennis PR
    before :each do
      bowling = Bowling.new ('Adrian')
    end
    it 'has one player'do
     bowling = Bowling.new ('Adrian')
     expect(bowling.player).to eq('Adrian')
    end
  end

  describe 'score' do
    it 'calculates total score between two frames' do
      bowling = Bowling.new ('Adrian')
      bowling.frame_result(1,3)
      bowling.score_recorder(bowling.try_result)
      bowling.frame_result(2,3)
      bowling.score_recorder(bowling.try_result)
      expect(bowling.total_score).to eq(9)
    end

    it 'can store spares in score array' do
      bowling = Bowling.new ('Adrian')
      bowling.frame_result(7,3)
      bowling.score_recorder(bowling.try_result)
      expect(bowling.frame_record[0]).to eq('S')
    end
    it 'can store strikes in score array' do
    bowling = Bowling.new ('Adrian')
    bowling.frame_result(10,0)
    bowling.score_recorder(bowling.try_result)
    expect(bowling.frame_record[0]).to eq('X')
    end
    it 'can store 10 frames' do
      bowling = Bowling.new ('Adrian')
      tries = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
      tries.each do |tries|
        bowling.frame_result(tries, 0)
        bowling.score_recorder(bowling.try_result)
      end
      expect(bowling.frame_record).to eq(["X", "X", "X", "X", "X", "X", "X", "X", "X", "X"])
    end

    it 'can add score correctly for 3 consecutive strikes' do
      bowling = Bowling.new ('Adrian')

      tries = [10, 10, 10]
      tries.each do |tries|
        bowling.frame_result(tries, 0)
        bowling.score_recorder(bowling.try_result)
      end
      #needed to add the score for the last two strikes
      bowling.frame_result(0, 0)
      bowling.score_recorder(bowling.try_result)
      expect(bowling.total_score).to eq(60)
    end

    it 'can add score correctly for 2 consecutive strikes' do
      bowling = Bowling.new ('Adrian')

      tries = [10, 10]
      tries.each do |tries|
        bowling.frame_result(tries, 0)
        bowling.score_recorder(bowling.try_result)
      end
      #needed to add the score for the last two strikes
      bowling.frame_result(0, 0)
      bowling.score_recorder(bowling.try_result)
      expect(bowling.total_score).to eq(30)
    end

    it 'can add score correctly for spares' do
      bowling = Bowling.new ('Adrian')
      bowling.frame_result(5, 5)
      bowling.score_recorder(bowling.try_result)

      bowling.frame_result(0, 1)
      bowling.score_recorder(bowling.try_result)
      expect(bowling.total_score).to eq(11)
    end

  end
end
