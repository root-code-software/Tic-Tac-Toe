
require_relative '../lib/tic_tac_toe.rb'

def msg(text)
  puts text
end

def ask_input(message)
  msg(message)
  result= gets.chomp
  result
end

def show_board(board)
  puts " #{board[0] == 10 ? 'X' : board[0]} | #{board[1] == 10 ? 'X' : board[1]} | #{board[2] == 10 ? 'X' : board[2]}"
  puts " #{board[3] == 10 ? 'X' : board[3]} | #{board[4] == 10 ? 'X' : board[4]} | #{board[5] == 10 ? 'X' : board[5]}"
  puts " #{board[6] == 10 ? 'X' : board[6]} | #{board[7] == 10 ? 'X' : board[7]} | #{board[8] == 10 ? 'X' : board[8]}"
end

module TicTacToe
  in_game = false

  class Player
    attr_accessor :name, :score

    def initialize(score=0)
      @name = 'Player'
    end

    def name
      @name
    end

    def name=(name) 
      @name = name
    end
  end

  class UserInterface
    attr_accessor :player1, :player2
    
    def initialize
      welcome
      game
    end

    def welcome
      msg('Welcome to Tic Tac Toe')
      names
      rules
    end

    def names
      @player1 = TicTacToe::Player.new
      @player2 = TicTacToe::Player.new

      puts 'Player 1 insert your name:'      
      @player1.name = gets.chomp
      puts 'Player 2 insert your name:'      
      @player2.name = gets.chomp
      puts 'Is this ok?:'
      puts "Player One: #{@player1.name.capitalize}, Player 2: #{@player2.name.capitalize}"
      puts '(press Y or yes if you agree or press N or no to change the names)'
      names_completion = gets.chomp.upcase

      while !check_completion(names_completion)
        puts 'Is this ok?:'
        puts "Player One: #{@player1.name.capitalize}, Player 2: #{@player2.name.capitalize}"
        puts '(press Y or yes if you agree or press N or no to change the names)'
        names_completion = gets.chomp.upcase
      end
    end

    def rules
      puts 'Do you want to review the rules?'
      puts '(press Y or yes if you agree)'
      see_rules = gets.chomp.upcase

      
      if see_rules == 'Y' || see_rules == 'YES'
        print <<-RULES
          1. The game is played on a grid that's 3 squares by 3 squares.

          2. You are X, your friend (or the computer in this case) is O. Players take turns putting their marks in empty squares.
          
          3. The first player to get 3 of her marks in a row (up, down, across, or diagonally) is the winner.
          
          4. When all 9 squares are full, the game is over. If no player has 3 marks in a row, the game ends in a tie. 
        RULES
      end
    end

    def game
      this=GameEngine.new(@player1.name, @player2.name)
    end

    

  end
end

game = TicTacToe::UserInterface.new 
