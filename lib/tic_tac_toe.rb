# frozen_string_literal: true

module TicTacToe
  class GameEngine
    attr_reader :board, :player1, :player2
    attr_writer :board, :player1, :player2

    def initialize(player1, player2)
      @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

      @player1 = player1
      @player2 = player2
    end

    def player1_name
      @player1
    end

    def player2_name
      @player2
    end

    def show_board
      @board
    end

    def reset_board
      @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    def update_board(mark, position)
      position = position.to_i
      if position.between?(1, 9)
        @board[position - 1] = mark
        return true
      end
      false
    end

    def verify_hand(position)
      @board.each do |i|
        return true if i.to_s == position
      end
      false
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
end
