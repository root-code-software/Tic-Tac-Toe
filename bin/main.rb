
require_relative '../lib/tic_tac_toe.rb'

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

# def verify_hand
#   loop do
#     return unless verify_hand
#     game.ask_hand # It changes player automatically
#   end
# end