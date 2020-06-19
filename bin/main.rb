#!/usr/bin/env ruby
require_relative('../lib/player.rb')
require_relative('../lib/move.rb')

def display_updated_board(moves)
  puts "

    ===========
    | #{moves[1]} | #{moves[2]} | #{moves[3]} |
    --- --- ---
    | #{moves[4]} | #{moves[5]} | #{moves[6]} |
    --- --- ---
    | #{moves[7]} | #{moves[8]} | #{moves[9]} |
    ===========

    "
end

puts "!!!Welcome to your favorite schooldays game!!!

This is the map of your tic-tac-toe board

     ===========
    | 1 | 2 | 3 |
     --- --- ---
    | 4 | 5 | 6 |
     --- --- ---
    | 7 | 8 | 9 |
     ===========

  Player 1: X
  Player 2: O

  "

puts 'Please enter the name of Player 1'
player1_name = gets.chomp
player1 = Player.new(player1_name)
puts "player 1 is called #{player1.name}"

puts 'Please enter the name of Player 2'
player2_name = gets.chomp
player2 = Player.new(player2_name)
puts "player 1 is called #{player2.name}"

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
moves = []
winning_move = false
game_on = true

while game_on
  # Turn for Player 1
  puts "#{player1.name}, please make your move!. Available cells are: #{available_moves}"
  player1_input = gets.chomp.upcase
  player1_move = Move.new(player1.name, player1_input)

  until available_moves.include?(player1_move.cell)
    puts 'Ooops! Your move is invalid!. Please try again'
    puts "#{player1.name}, please make your move!. Available cells are: #{available_moves}"
    player1_input = gets.chomp.upcase
    player1_move = Move.new(player1.name, player1_input)
  end

  player1_moves += 1

  moves[player1_move.cell.to_i] = 'X'
  available_moves = available_moves.reject { |ele| ele == player1_move.cell }
  puts 'Your move, is displayed on the board.'
  display_updated_board(moves)

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
  puts "#{player2.name}, it's your turn. Please make your move. Available cells are: #{available_moves}"
  player2_input = gets.chomp.upcase
  player2_move = Move.new(player2.name, player2_input)

  until available_moves.include?(player2_move.cell)
    puts 'Ooops! Your move is invalid!. Please try again'
    puts "#{player2.name}, please make your move!. Available cells are: #{available_moves}"
    player2_input = gets.chomp.upcase
    player2_move = Move.new(player2.name, player2_input)
  end

  player2_moves += 1
  moves[player2_move.cell.to_i] = 'O'
  available_moves = available_moves.reject { |ele| ele == player2_move.cell }
  puts 'Your move, is displayed on the board.'
  display_updated_board(moves)

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
