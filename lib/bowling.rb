require 'pry'
require 'active_support/all'

class Bowling


  def initialize(player)
    @player = player
    @frame = {try_1: 0, try_2: 0} #will potentially store the result after the user input
    @attempt
    @try_result = {try_1: 0, try_2: 0}
    @total_score = 0
    @possible_result
  end
  attr_accessor :player, :try_result

  def score_calculator
    #to do
  end

  def frame_result(input1, input2)
    try_result[:try_1] = input1
    if input2 < 10-input1
      try_result[:try_2] = input2
    else
      puts "The score input is not correct."
    end
  end

 #will use this method when calculating total_score - to re-write
  def strike (try_result)
    if try_result[:try_1] == 10
      return true
    else
      return false
    end
  end

  #will use this method when calculating total_score - to re-write
  def spare (try_result)
    a = try_result[:try_1] + try_result[:try_2]
    if a == 10
      return true
    else
      return false
    end
  end
end

#initial approach on what methods the game will need
#Write the test
