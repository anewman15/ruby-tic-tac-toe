#!/usr/bin/env ruby

puts 'Welcome to your favorite schooldays game!'

def display_board
  puts "
     ===========
    | 1 | 2 | 3 |
     --- --- ---
    | 4 | 5 | 6 |
     --- --- ---
    | 7 | 8 | 9 |
     ===========

  Player 1: use X
  Player 2: use O

  "
end

display_board

puts 'Please enter the name of Player 1'
player1_name = gets.chomp
puts "player 1 is called #{player1_name}"

puts 'Please enter the name of Player 2'
player2_name = gets.chomp
puts "player 2 is called #{player2_name}"

available_moves = %w[1 2 3 4 5 6 7 8 9]
WINNING_COMBINATIONS = [
  %w[1 2 3],
  %w[4 5 6],
  %w[7 8 9],
  %w[1 4 7],
  %w[2 5 8],
  %w[3 6 8],
  %w[1 5 9],
  %w[3 5 7]
].freeze

player1_moves = 0
player2_moves = 0
winning_move = false
game_on = true

while game_on
  # Turn for Player 1
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
  display_board

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

  # Turn for Player 2
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
  display_board

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
