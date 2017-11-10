require_relative 'bowling'

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

10.times do
  puts "Firs ball result: "
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
