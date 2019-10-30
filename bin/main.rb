
module TicTacToe
  in_game = false

  class Player
    attr_accessor :name, :score

    def initialize(score=0,name)
      @name = name
    end

    def initialize(score=0)
      @name = 'Player'
    end

    def name
      @name
    end

    def name=(name) #setter method
      @name = name
    end

    def ChooseHand(arr=nil)
      p 'Choose hand'
      # Display current board
    end
  end

  class UserInterface
    attr_accessor :player1, :player2
    
    def initialize
      p 'Welcome to Tic Tac Toe'

      names
      rules
      game
    end

    def names
      @player1 = TicTacToe::Player.new
      @player2 = TicTacToe::Player.new
      p 'Player 1 insert your name:'      
      @player1.name = gets.chomp
      p 'Player 2 insert your name:'      
      @player2.name = gets.chomp
      p 'Is this ok?:'
      p "Player One: #{@player1.name}, Player 2: #{@player2.name}"
      p '(press Y or yes if you agree)'
      names_completion = gets.chomp
      if names_completion =='Y' || names_completion =='yes'
        return true
      else
        p 'Change the names then'
        Names
      end
    end

    def rules
      p 'Do you want to review the rules?'
      p '(press Y or yes if you agree)'
      see_rules = gets.chomp

      if see_rules == 'Y' || see_rules == 'yes'
        p <<-RULES
          1. The game is played on a grid that's 3 squares by 3 squares.

          2. You are X, your friend (or the computer in this case) is O. Players take turns putting their marks in empty squares.
          
          3. The first player to get 3 of her marks in a row (up, down, across, or diagonally) is the winner.
          
          4. When all 9 squares are full, the game is over. If no player has 3 marks in a row, the game ends in a tie. 
        RULES
      end
    end

    def game
      @board = [
        ['', ''. ''],
        ['', 'X'. ''],
        ['', ''. '']
      ]
    end

    def Player1Name
      @player1.name
    end

    def Player2Name
      @player2.name
    end
  end
end

game = TicTacToe::UserInterface.new 
