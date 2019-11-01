
require_relative '../lib/tic_tac_toe.rb' 

def ask_input(message)
  puts message
  result= gets.chomp
  result
end

def show_board(board)
  puts " #{board[0] == 10 ? 'X' : board[0]} | #{board[1] == 10 ? 'X' : board[1]} | #{board[2] == 10 ? 'X' : board[2]}"
  puts " #{board[3] == 10 ? 'X' : board[3]} | #{board[4] == 10 ? 'X' : board[4]} | #{board[5] == 10 ? 'X' : board[5]}"
  puts " #{board[6] == 10 ? 'X' : board[6]} | #{board[7] == 10 ? 'X' : board[7]} | #{board[8] == 10 ? 'X' : board[8]}"
end

def player_action(turn, game)
  player = check_player(turn, game)
  puts "Player #{player} is your turn"
  position = ask_input('Choose your hand')
  mark = player == game.player1_name ? 10 : 0

  is_verified = game.verify_hand(position)
  until is_verified
    position = ask_input('Choose your hand')
    break if game.verify_hand(position)
  end
  game.update_board(mark, position)
  show_board(game.show_board)
end


def check_player(turn = 0, game)
  if turn.odd?
    game.player1_name
  else
    game.player2_name
  end
end

def game_loop(game)
  show_board(game.show_board)
  turn = 1
  while turn < 10
    player_action(turn, game)

    if turn > 4
      win = game.verify_win
      winer = win[1] == 10 ? game.player1_name : game.player2_name
      if win[0]
        return win[0]
        break
      end
    end

    turn += 1
    false if turn == 10
  end
end

def welcome
  puts 'Welcome to Tic Tac Toe'
end

def get_names
  puts 'Player 1 insert your name:'      
  player1 = gets.chomp
  puts 'Player 2 insert your name:'      
  player2 = gets.chomp
  puts 'Is this ok?:'
  puts "Player One: #{player1.capitalize}, Player 2: #{player2.capitalize}"
  puts '(press Y or yes if you agree or press N or no to change the names)'
  names_completion = gets.chomp.upcase

  while !check_completion(names_completion)
    puts 'Is this ok?:'
    puts "Player One: #{player1.capitalize}, Player 2: #{player2.capitalize}"
    puts '(press Y or yes if you agree or press N or no to change the names)'
    names_completion = gets.chomp.upcase
  end
  [player1, player2]
end

def check_completion(names_completion)
  if names_completion =='Y' || names_completion =='YES'
    return true
  elsif names_completion == 'N' || names_completion == 'NO'
    puts 'Change the names then'
    get_names
    false
  end
end

def show_rules
  puts 'Do you want to review the rules?'
  puts '(press Y or yes if you agree)'
  see_rules = gets.chomp.upcase
  
  return false unless see_rules == 'Y' || see_rules == 'YES'
  print <<-RULES
  1. The game is played on a grid that's 3 squares by 3 squares

  2. You are X, your friend (or the computer in this case) is O. Players take turns putting their marks in empty squares.

  3. The first player to get 3 of her marks in a row (up, down, across, or diagonally) is the winner.

  4. When all 9 squares are full, the game is over. If no player has 3 marks in a row, the game ends in a tie. 
  RULES
  true
end

welcome

names = get_names

game = TicTacToe::GameEngine.new(names[0], names[1])

show_rules

game_loop(game)
