# frozen_string_literal: true

class GameEngine
  attr_accessor :board, :player1, :player2

  def initialize(player1, player2)
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    @player1 = player1
    @player2 = player2

    show_board(@board)

    game_loop
  end

  def game_loop
    turn = 1
    while turn < 10
      player_action(turn)

      if turn > 5
        win = verify_win
        winer = win[1] == 10 ? @player1 : @player2
        if win[0]
          show_board(@board)
          msg("#{winer} Is the winner")
          break
        end
      end

      show_board(@board)
      turn += 1
      msg('None win') if turn == 10
    end
  end

  def player_action(turn)
    player = check_player(turn)
    msg("Player #{player} is your turn")
    position = ask_input('Choose your hand')
    mark = player == @player1 ? 10 : 0

    is_verified = verify_hand(position)
    until is_verified
      position = ask_input('Choose your hand')
      break if verify_hand(position)
    end
    update_board(mark, position)
  end

  def reset_board
    @board = [1, 2, 3, 4, 10, 6, 7, 8, 9]
    msg('Board reseted to default')
  end

  def update_board(mark, position)
    position = position.to_i
    if position.between?(1, 9)
      @board[position - 1] = mark
    else
      msg('That position don\'t exit')
    end
  end

  def verify_hand(position)
    @board.each do |i|
      return true if i.to_s == position
    end
    msg('position is occupied or not in the array')
    false
  end

  def check_player(turn = 0)
    if turn.odd?
      @player1
    else
      @player2
    end
  end

  def verify_win
    win_tests = [
      [@board[0], @board[1], @board[2]],
      [@board[3], @board[4], @board[5]],
      [@board[6], @board[7], @board[8]],
      [@board[0], @board[3], @board[6]],
      [@board[1], @board[4], @board[7]],
      [@board[2], @board[5], @board[8]],
      [@board[0], @board[4], @board[8]],
      [@board[2], @board[4], @board[6]]
    ]

    is_equal = false
    mark = 11

    win_tests.each do |test|
      next unless test[0] == test[1] && test[0] == test[2]

      is_equal = true
      mark = test[0]
    end

    [is_equal, mark]
  end
end
