require 'pry'
require 'active_support/all'

class Bowling


  def initialize(player)
    @player = player
    @try_result = {try_1: 0, try_2: 0}
    @total_score = 0
    @frame_record = []
    @counter = 0
    @frame
    @strike_counter = 0
  end

  attr_accessor :player, :try_result, :total_score, :frame, :frame_record, :counter, :strike_counter

  def current_score
    "#{player} - Frame record: #{frame_record} - Total score: #{total_score}"
  end

  def score_recorder(try_result)
   @frame = try_result[:try_1] + try_result[:try_2]
   if counter  == 0
      if strike(try_result) == true
        frame_record << 'X'
        @counter +=1
        @strike_counter += 1
      elsif spare(try_result) == true
        frame_record << 'S'
        @counter +=1
      elsif frame < 10
        frame_record << frame
        @total_score += frame
        @counter +=1
      else
        puts "Please check your input and try again"
      end

  elsif counter < 10
    if strike(try_result) == true
      strike_calculator(counter)
      frame_record << 'X'
      @counter +=1
    elsif spare(try_result) == true
      spare_calculator(counter)
      frame_record << 'S'
      @counter +=1
    elsif frame < 10
      number_calculator(counter)
      frame_record << frame
      @counter +=1
    else
      puts "Please check your input and try again"
    end

  # elsif counter == 10

  else
    puts "wtf"
  end
end

  def strike_calculator(counter)
    second_element = frame_record[counter-1]
    if second_element == 'X'
      if strike_counter == 1
        @strike_counter += 1
      elsif strike_counter == 2
        @total_score += 30
      else
        puts "error strike calculator"
      end
    elsif second_element == 'S'
      @total_score += 20
      @strike_counter += 1
    elsif second_element < 10
      @strike_counter += 1
    else
      puts "something went wrong strike calculator"
    end
  end

  def spare_calculator(counter)
    second_element = frame_record[counter-1]
    if second_element == 'X'
      if strike_counter == 2
        @total_score += 20
        @total_score += 20 + try_result[:try_1]
        @strike_counter = 0

      elsif strike_counter == 1
        @total_score += 20
        @strike_counter = 0
      end
    elsif second_element == 'S'
      @total_score += 10 + try_result[:try_1]
    else
      puts "something went wrong spare calculator"
    end
  end


  def number_calculator(counter)
    second_element = frame_record[counter-1]
    if second_element == 'X'
      if strike_counter == 1 #considering case/switch
        @total_score += 10 + frame * 2
        @strike_counter = 0
      elsif strike_counter >= 2
        @total_score += 20 + try_result[:try_1]
        @total_score += 10 + frame * 2
        @strike_counter = 0
      else
      end
    elsif second_element == 'S'
      @total_score += 10 + try_result[:try_1] + frame
    elsif second_element < 10
      @total_score += frame
    else
    end
  end

  def frame_result(input1, input2)
    @try_result[:try_1] = input1
    if input2 <= 10-input1
      @try_result[:try_2] = input2
    else
      puts "The score input is not correct."
    end
  end

  def strike (try_result)
    if try_result[:try_1] == 10
      return true
    else
      return false
    end
  end

  def spare (try_result)
    a = try_result[:try_1] + try_result[:try_2]
    if a == 10
      return true
    else
      return false
    end
  end

end
