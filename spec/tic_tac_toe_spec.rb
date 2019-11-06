# frozen_string_literal: true

require_relative '../lib/tic_tac_toe.rb'

RSpec.describe TicTacToe::GameEngine do
  let(:game) { TicTacToe::GameEngine.new('Israel', 'Izaias')}
  let(:board) {  [1, 2, 3, 4, 5, 6, 7, 8, 9] }

  describe '#player1_name' do
    context 'Shows the correct name of player 1' do
      it do
        expect(game.player1_name).to eq('Israel')
      end
    end
  end

  describe '#player2_name' do
    context 'Shows the correct name of player 2' do
      it do
        expect(game.player2_name).to eq('Izaias')
      end
    end
  end

  describe '#show_board' do
    context 'Displays the current board status to the user' do
      it do
        expect(game.show_board).to eq(board)
      end
    end
  end

  describe '#reset_board' do
    context 'It resets the board to default so a new game can be played' do
      it do
        expect(game.reset_board).to eq(board)
      end
    end
  end

  describe '#update_board' do
    context 'Return false whenever the input is not a number' do
      it 'Return false if input is string' do
        expect(game.update_board(10, String)).to eq(false)
      end

      it 'Return false if input is array ' do 
        expect(game.update_board(10, Array)).to eq(false)
      end

      it 'Return false if input is symbol' do
        expect(game.update_board(10, Symbol)).to eq(false)
      end
    end

    context 'Return false unless user insert an input' do
      it 'Return false if input is just a space' do
        expect(game.update_board(10, )).to eq(false)
      end
    end

    context 'Return false if' do
      it 'request position is smaller than board size' do
        expect(game.update_board(10, 0)).to eq(false)
      end

      it 'requested position is bigger than board size' do
        expect(game.update_board(0, 10)).to eq(false)
      end
    end

    context 'Incorrect mark input' do
      it 'if mark is not 0 or 10' do
        expect(game.update_board(String, 1)).to eq(false)
        expect(game.update_board(Array, 1)).to eq(false)
        expect(game.update_board(Symbol, 1)).to eq(false)
        expect(game.update_board(5, 1)).to eq(false)
      end
    end

    context 'Correct mark input (10 or 0)' do
      it 'if mark is a 0 or 10' do
        expect(game.update_board(10, 1)).to eq(true)
        expect(game.update_board(0, 1)).to eq(true)
      end
    end
  end
end
