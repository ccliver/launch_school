#!/usr/bin/env ruby

require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]] # diagonals
FIRST_TURN = 'player'

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  # system 'clear'
  puts "You're an #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |   #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |   #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |   #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def computer_places_piece!(brd)
  square = nil

  ## Offense
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  ## Defense
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  ## Square 5
  if !square && brd[5] == INITIAL_MARKER
    square = 5
  end

  ## Random square
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def joinor(numbers, separator = ', ', final_separator = 'or')
  if numbers.count == 1
    return numbers[0]
  elsif numbers.count == 2
    return "#{numbers[0]} #{final_separator} #{numbers[1]}"
  else
    rval = numbers.shift.to_s
    numbers.each_with_index do |number, index|
      if index + 1 == numbers.count
        rval << "#{separator}#{final_separator} #{number}"
      else
        rval << "#{separator} #{number}"
      end
    end
    return rval
  end
end

player_wins = 0
computer_wins = 0
loop do
  board = initialize_board

  loop do
    display_board(board)

    if FIRST_TURN == 'player'
      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    else
      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
      display_board(board)
      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end
  end
  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    if detect_winner(board) == 'Player'
      player_wins += 1
    else
      computer_wins += 1
    end
  else
    prompt "It's a tie!"
  end

  display_board(board)

  puts "Player wins: #{player_wins}"
  puts "Computer wins: #{computer_wins}"
  if player_wins == 5
    puts "Player has won 5 times, quitting."
    break
  end
  if computer_wins == 5
    puts "Computer has won 5 times, quitting."
    break
  end
  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
