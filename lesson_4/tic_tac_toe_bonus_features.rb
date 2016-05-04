require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = "X".freeze
COMPUTER_MARKER = "O".freeze
WINNING_LINES = [[1, 2, 3], [1, 4, 7], [1, 5, 9]] +
                [[2, 5, 8], [3, 6, 9], [3, 5, 7]] +
                [[4, 5, 6], [7, 8, 9]].freeze

def prompt(message)
  puts "=> #{message}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  # system 'clear'
  prompt "You are #{PLAYER_MARKER} computer is #{COMPUTER_MARKER}"
  puts
  puts "  Sqr1  |   Sqr2  |   Sqr3  "
  puts "        |         |       "
  puts "    #{brd[1]}   |    #{brd[2]}    |    #{brd[3]}  "
  puts "        |         |       "
  puts "........+.........+........."
  puts "  Sqr4  |   Sqr5  |   Sqr6  "
  puts "        |         |       "
  puts "    #{brd[4]}   |    #{brd[5]}    |    #{brd[6]}  "
  puts "        |         |       "
  puts "........+.........+........."
  puts "  Sqr7  |   Sqr8  |   Sqr9  "
  puts "        |         |       "
  puts "    #{brd[7]}   |    #{brd[8]}    |    #{brd[9]}  "
  puts "        |         |       "
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, comma=', ', word='or')
  arr[-1] = "#{word} #{arr.last}" if arr.length > 1
  arr.join(comma)
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square #{joinor(empty_squares(brd))}: "
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry please choose a number between 1 to 9"
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
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
    # if brd[line[0]] == PLAYER_MARKER &&
    #   brd[line[1]] == PLAYER_MARKER &&
    #   brd[line[2]] == PLAYER_MARKER
    #   return 'Player'
    # elsif brd[line[0]] == COMPUTER_MARKER &&
    #       brd[line[1]] == COMPUTER_MARKER &&
    #       brd[line[2]] == COMPUTER_MARKER
    #   return 'Computer'
    # end
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

player_count = 0
computer_count = 0
def count_winnings(result)
  player_count += 1 if detect_winner(board) == 'Player'
  computer_count += 1 if detect_winner(board) == 'Computer'
  player_count
  computer_count
end

result = 0

loop do
  prompt("How many rounds you want to play?")
  rounds_number = gets.chomp.to_i
  prompt("Good luck! The first one to win #{rounds_number} rounds wins the game!")

  player_count = 0
  computer_count = 0

  loop do
    board = initialize_board

    loop do
      display_board(board)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      display_board(board)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
    else
      prompt "Is tie"
    end

    player_count += 1 if detect_winner(board) == 'Player'
    computer_count += 1 if detect_winner(board) == 'Computer'

    prompt("Player has #{player_count} points")
    prompt("Computer has #{computer_count} points")

    break if player_count == rounds_number || computer_count == rounds_number
  end

  prompt "Do you want to play again?(y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe"
