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

# First turn for Player 1
puts 'Player 1, please make your move!'
player1_input = gets.chomp

puts "Are you sure you want to put X into #{player1_input} - Y/N?"
player1_decision = gets.chomp
puts "Your decision for #{player1_input} is #{player1_decision}."

# if Yes
puts 'Your move, is displayed on the board.'
# Display updated board

# if No
puts 'Player 1, please make your move!'
player1_input = gets.chomp

puts "Are you sure you want to put X into #{player1_input} - Y/N?"
player1_decision = gets.chomp
puts "Your decision for #{player1_input} is #{player1_decision}."

# Turn for player 2
puts "Now it's Player 2's turn. Player 2, please make your move"
player2_input = gets.chomp

puts "Are you sure you want to put O into #{player2_input} - Y/N?"
player2_decision = gets.chomp
puts "Your decision for #{player2_input} is #{player2_decision}."

# if Yes
puts 'Your move is displayed on the board.'
# Display updated board

# if No
puts 'Player 2, please make your move!'
player2_input = gets.chomp

puts "Are you sure you want to put O into #{player2_input} - Y/N?"
player2_decision = gets.chomp
puts "Your decision for #{player2_input} is #{player2_decision}."

# New turn for player 1
puts "Now it's Player 1's turn. Player 1, please make your move"
player1_input = gets.chomp

# if user input already occupied
puts "#{player1_input} is already occupied. Please look at the board and fill another cell."
# Display board

# if 3 contiguous cells are occupied by the same player
puts 'Player 1 won the game!'
# OR
puts 'Player 2 won the game!'
