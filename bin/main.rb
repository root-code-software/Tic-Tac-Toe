
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
      puts 'Welcome to Tic Tac Toe'

      names
      rules
      mock_game
    end

    def mock_game
      plays = 0
      while plays <= 9
        puts "Player #{ plays.odd? ? @player1.name : @player2.name } it's your turn, please enter your play"
        play = gets.chomp
        plays += 1
      end

      puts "Player #{ plays.odd? ? @player1.name : @player2.name } won!"
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

    def check_completion(names_completion)
      if names_completion =='Y' || names_completion =='YES'
        return true
      elsif names_completion == 'N' || names_completion == 'NO'
        puts 'Change the names then'
        names
        false
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
  end
end

game = TicTacToe::UserInterface.new 
