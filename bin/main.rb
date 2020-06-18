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

puts 'Please enter the name of Player 1'
player1_name = gets.chomp
puts "player 1 is called #{player1_name}"

puts 'Please enter the name of Player 2'
player2_name = gets.chomp
puts "player 2 is called #{player2_name}"

available_moves = %w[A1 B1 C1 A2 B2 C2 A3 B3 C3]
WINNING_COMBINATIONS = [%w[A1 B1 C1], %w[A2 B2 C2], %w[A3 B3 C3], %w[A1 A2 A3], %w[B1 B2 B3],
                        %w[C1 C2 C3], %w[A1 B2 C3], %w[C1 B2 A3]].freeze
player1_moves = 0
player2_moves = 0
winning_move = false
game_on = true
while game_on
  # First turn for Player 1
  puts "#{player1_name}, please make your move!. Available cells are: #{available_moves}"
  player1_input = gets.chomp.upcase

  until available_moves.include?(player1_input)
    puts 'Ooops! Your move is invalid!. Please try again'
    puts "#{player1_name}, please make your move!. Available cells are: #{available_moves}"
    player1_input = gets.chomp.upcase
  end

  player1_moves += 1

  available_moves = available_moves.reject { |ele| ele == player1_input }
  puts 'Your move, is displayed on the board.'
  # Display updated board

  if winning_move
    winner = player1_name
    puts "#{winner} won the game!!"
    game_on = false
    break
  elsif !winning_move && available_moves.length.zero?
    puts 'The game is a draw'
    game_on = false
    break
  end

  puts "#{player2_name}, it's your turn. Please make your move. Available cells are: #{available_moves}"
  player2_input = gets.chomp.upcase

  until available_moves.include?(player2_input)
    puts 'Ooops! Your move is invalid!. Please try again'
    puts "#{player2_name}, please make your move!. Available cells are: #{available_moves}"
    player2_input = gets.chomp.upcase
  end

  player2_moves += 1
  available_moves = available_moves.reject { |ele| ele == player2_input }
  puts 'Your move, is displayed on the board.'
  # Display updated board

  if winning_move
    winner = player2_name
    puts "#{winner} won the game!!"
    game_on = false
    break
  elsif !winning_move && available_moves.length.zero?
    puts 'The game is a draw'
    game_on = false
    break
  end

end

# # if 3 contiguous cells are occupied by the same player
# puts 'Player 1 won the game!'
# # OR
# puts 'Player 2 won the game!'
