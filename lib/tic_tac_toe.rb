# frozen_string_literal: true

module TicTacToe
  class UserInterface

  end

  class GameEngine
    attr_accessor :board, :player1, :player2

    def initialize(player1, player2)
      @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

      @player1 = player1
      @player2 = player2
    end

    def reset_board
      @board = [1, 2, 3, 4, 10, 6, 7, 8, 9]
    end

    def update_board(mark, position)
      position = position.to_i
      if position.between?(1, 9)
        @board[position - 1] = mark
        p @board
        return true
      end
      false
    end
  end
end
