
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
      game
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

    def game
      
      match = GameEngine.new
      
      turn = 1
      match.show_board

      while turn <= 9
        if turn > 5
          # break if verify_win
          win = match.verify_win

          if win[0]
            puts "#{win[1] == 10 ? @player1.name : @player2.name} Is the winner"
          end
          
          break if win[0]
        end
        player = check_player(turn)
        puts "Player #{player} is your turn"
        ChangePlayer(match, player)
        turn += 1        
      end
    end

    def check_player(turn=0)
      if turn.odd?
        @player1.name
      else
        @player2.name
      end
    end
    
    def ChangePlayer(match, player)
      
      hand = get_hand

      mark = player === @player1.name ? 10 : 0 
      match.update_board(mark, hand)
    end

    def get_hand      
      puts 'Choose your hand'
      hand = gets.chomp
      hand
    end

    def Player1Name
      @player1.name
    end

    def Player2Name
      @player2.name
    end
  end
end

class GameEngine
  attr_accessor :board
  
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def show_board    
    puts " #{ @board[0] == 10? 'X' : @board[0] } | #{ @board[1] == 10? 'X' : @board[1] } | #{ @board[2] == 10? 'X' : @board[2] }"
    puts " #{ @board[3] == 10? 'X' : @board[3] } | #{ @board[4] == 10? 'X' : @board[4] } | #{ @board[5] == 10? 'X' : @board[5] }"
    puts " #{ @board[6] == 10? 'X' : @board[6] } | #{ @board[7] == 10? 'X' : @board[7] } | #{ @board[8] == 10? 'X' : @board[8] }"
  end

  def reset_board
    @board = [1, 2, 3, 4, 10, 6, 7, 8, 9]
    puts 'Board reseted to default'
  end

  def update_board(mark, position)

    is_verified = verify_hand(position)
    
    while !is_verified
      puts 'Choose your hand'
      position = gets.chomp
      
      break if verify_hand(position)
    end
    
    case position
    when '1'
      @board[0]=mark
    when '2'
      @board[1]=mark
    when '3'
      @board[2]=mark
    when '4'
      @board[3]=mark
    when '5'
      @board[4]=mark
    when '6'
      @board[5]=mark
    when '7'
      @board[6]=mark
    when '8'
      @board[7]=mark
    when '9'
      @board[8]=mark
    else
      puts 'That position don\'t exit'
      false 
    end
    show_board
  end

  def verify_hand(position)
    @board.each do |i|
      if i.to_s == position
        return true
      end
    end
    puts 'position is occupied or not in the array'
    return false
  end

  def verify_win
    win_tests = [
      [@board[0],@board[1],@board[2]],
      [@board[3],@board[4],@board[5]],
      [@board[6],@board[7],@board[8]],
      [@board[0],@board[3],@board[6]],
      [@board[1],@board[4],@board[7]],
      [@board[2],@board[5],@board[8]],
      [@board[0],@board[4],@board[8]],
      [@board[2],@board[4],@board[6]],
    ]

    is_equal = false
    mark = 11

    win_tests.each do |test|
      if test[0] == test[1] && test[0] == test[2]
        is_equal = true
        mark = test[0]
      end
    end

    return [is_equal, mark]
  end

end

game = TicTacToe::UserInterface.new 
