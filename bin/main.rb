#!/usr/bin/env ruby

puts 'Hello, world!'

puts "      A    B    C
    ===============
1  | A1 | B1 | C1 |
    ---  ---- ----
2  | A2 | B2 | C2 |
    ---- ---- ----
3  | A3 | B3 | C3 |
    ---- ---- ---

Player 1: use X
Player 2: use O

"

puts "Please enter the name of Player 1"
player1_name = gets.chomp
puts "player 1 is called #{player1_name}"

puts "Please enter the name of Player 2"
player2_name = gets.chomp
puts "player 2 is called #{player2_name}"

available_moves = ["A1", "B1", "C1", "A2", "B2", "C2", "A3", "B3", "C3"]
game_on = true
while game_on 
  # First turn for Player 1
  puts "#{player1_name}, please make your move!. Available cells are: #{available_moves}"
  player1_input = gets.chomp.upcase

  until available_moves.include?(player1_input) do
    puts "Ooops! Your move is invalid!. Please try again"
    puts "#{player1_name}, please make your move!. Available cells are: #{available_moves}"
    player1_input = gets.chomp.upcase
  end

  available_moves = available_moves.reject { |ele| ele == player1_input }
  puts "Your move, is displayed on the board."
  # Display updated board

  puts "#{player2_name}, it's your turn. Please make your move. Available cells are: #{available_moves}"
  player2_input = gets.chomp.upcase
  
  until available_moves.include?(player2_input) do
    puts "Ooops! Your move is invalid!. Please try again"
    puts "#{player2_name}, please make your move!. Available cells are: #{available_moves}"
    player2_input = gets.chomp.upcase
  end

  available_moves = available_moves.reject { |ele| ele == player2_input }
  puts "Your move, is displayed on the board."
  # Display updated board
end



# # if 3 contiguous cells are occupied by the same player
# puts 'Player 1 won the game!'
# # OR
# puts 'Player 2 won the game!'
