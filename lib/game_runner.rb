require_relative 'bowling'
require 'pry'

def capture_name
  puts "Player name: "
  @player = gets.chomp
end

capture_name

game = Bowling.new(@player)

puts "Game has started!"
puts "When prompted, insert how many pins did the respective ball score."
puts "*******************************************************************"
puts game.current_score


#method to add points to the first 9 frames
9.times do
  puts "First ball result: "
  ball_1 = gets.chomp.to_i
  if ball_1 == 10
    ball_2 = 0
  else
    puts "Second ball result: "
    ball_2 = gets.chomp.to_i
  end

  game.frame_result(ball_1, ball_2)
  game.score_recorder(game.try_result)

  puts game.current_score
end

#method to add points just to the 10th frame
def round_ten(game)
  puts "Round 10 first ball: "
  ball_1 = gets.chomp.to_i
  if ball_1 == 10
    puts "Round 10 second ball: "
    ball_2 = gets.chomp.to_i
    score_modifier(ball_1, ball_2, game)
    if ball_2 == 10
      puts "Round 10 last ball: "
      ball_3 = gets.chomp.to_i
      if ball_3 == 10
        game.total_score += 30
        game.frame_record << 'X-X-X'
      elsif ball_3 < 10
        game.total_score += 20 + ball_3
        game.frame_record << "X-X-#{ball_3}"
      else
        puts "Wrong input (case 1 - if 1)"
      end
    elsif ball_2 < 10
      puts "Round 10 last ball: "
      ball_3 = gets.chomp.to_i
      if ball_3 > ball_2 && ball_2 > 0 #would unless work here?
        puts "wrong input"
      else
        game.total_score += 10 + ball_3 + ball_2
        if ball_3 + ball_2 == 10
          game.frame_record << "X-#{ball_2}-S"
        else
         game.frame_record << "X-#{ball_2}-#{ball_3}"
       end
      end
    else
      return false
    end

  elsif ball_1 < 10
    puts "Round 10 second ball: "
    ball_2 = gets.chomp.to_i
    if ball_1 + ball_2 < 10
      game.total_score += ball_1 + ball_2
      game.frame_record << "#{ball_1}-#{ball_2}"

    elsif ball_1 + ball_2 == 10
      puts "Round 10 last ball: "
      ball_3 = gets.chomp.to_i
      game.total_score += ball_1 + ball_2 + ball_3
      game.frame_record << "#{ball_1}-S-#{ball_3}"
    else
      return false
    end

  else
    puts "something went wrong in last round"
  end
end

#method to add points to frame 8 and 9
def score_modifier(ball_1, ball_2, game)
  if ball_1 == 10
    if game.strike_counter == 2
      game.total_score += 60
    elsif game.strike_counter == 1
      if ball_2 == 10
        game.total_score += 30
      else
        game.total_score += 20 + ball_2
      end
    elsif game.frame_record[8] == 'S'
      game.total_score += 10 + ball_1
    else
      return false
    end
  elsif ball_1 < 10
    if game.strike_counter == 2
      game.total_score += 20 + ball_1
      game.total_score += 10 + ball_1 + ball_2
    elsif game.strike_counter == 1
      game.total_score += 10 + ball_1 + ball_2
    elsif game.frame_record[8] == 'S'
      game.total_score += 10 + ball_1
    else
      return false
    end
  end
end

round_ten(game)

puts game.current_score
