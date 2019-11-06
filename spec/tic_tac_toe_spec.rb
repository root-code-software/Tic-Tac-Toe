# frozen_string_literal: true

require_relative '../lib/tic_tac_toe.rb'

RSpec.describe TicTacToe::GameEngine do
  let(:game) { TicTacToe::GameEngine.new('Israel', 'Izaias') }
  let(:board) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }

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
        expect(game.update_board(5, 1)).to eq(false)
      end
      
      it 'mark is string' do
        expect(game.update_board(String, 1)).to eq(false)
      end
      
      it 'mark is array' do
        expect(game.update_board(Array, 1)).to eq(false)
      end
      
      it 'mark is Symbol' do
        expect(game.update_board(Symbol, 1)).to eq(false)
      end
    end

    context 'Correct mark input (10 or 0)' do
      it 'if mark is a 0' do
        expect(game.update_board(0, 1)).to eq(true)
      end

      it 'if mark is a 10' do
        expect(game.update_board(10, 1)).to eq(true)
      end
    end
  end

  describe '#verify_hand' do
    context 'Return false if' do
      it 'position is Numeric' do
        expect(game.verify_hand(Numeric)).to eq(false)
      end
      
      it 'position is Array' do
        expect(game.verify_hand(Array)).to eq(false)
      end
      
      it 'position is Symbol' do
        expect(game.verify_hand(Symbol)).to eq(false)
      end

      it 'position is smaller than board size' do
        expect(game.verify_hand('0')).to eq(false)
      end

      it 'position is bigger than board size' do
        expect(game.verify_hand('10')).to eq(false)
      end
    end

    context 'Return true with correct input' do
      it do
        expect(game.verify_hand('9')).to eq(true)
      end
    end
  end

  describe '#verify_win' do
    context 'return' do
      it 'an array' do
        expect(game.verify_win).to be_an(Array)
      end

      it 'an array of length 2' do
        expect(game.verify_win.length).to eq(2)
      end
    end

    context 'not showing a win' do
      it 'its starting' do
        game.reset_board
        expect(game.verify_win).to eq([false, 11])
      end

      it 'when there is a tie' do
        game.reset_board
        game.update_board(0,1)
        game.update_board(10,2)
        game.update_board(0,3)
        game.update_board(10,4)
        game.update_board(0,5)
        game.update_board(10,9)
        game.update_board(0,8)
        game.update_board(10,7)
        game.update_board(0,6)
        expect(game.verify_win).to eq([false, 11])
      end
    end

    context 'Check all winning situations' do
      it 'First Row' do
        game.reset_board
        game.update_board(0,1)
        game.update_board(0,2)
        game.update_board(0,3)
        expect(game.verify_win).to eq([true, 0])
      end

      it 'Second Row' do
        game.reset_board
        game.update_board(0,4)
        game.update_board(0,5)
        game.update_board(0,6)
        expect(game.verify_win).to eq([true, 0])
      end

      it 'Third Row' do
        game.reset_board
        game.update_board(0,7)
        game.update_board(0,8)
        game.update_board(0,9)
        expect(game.verify_win).to eq([true, 0])
      end

      it 'First Column' do
        game.reset_board
        game.update_board(0,1)
        game.update_board(0,4)
        game.update_board(0,7)
        expect(game.verify_win).to eq([true, 0])
      end

      it 'Second Column' do
        game.reset_board
        game.update_board(0,2)
        game.update_board(0,5)
        game.update_board(0,8)
        expect(game.verify_win).to eq([true, 0])
      end

      it 'Third Column' do
        game.reset_board
        game.update_board(0,3)
        game.update_board(0,6)
        game.update_board(0,9)
        expect(game.verify_win).to eq([true, 0])
      end

      it 'First Diagonal' do
        game.reset_board
        game.update_board(0,1)
        game.update_board(0,5)
        game.update_board(0,9)
        expect(game.verify_win).to eq([true, 0])
      end

      it 'Second Diagonal' do
        game.reset_board
        game.update_board(0,3)
        game.update_board(0,5)
        game.update_board(0,7)
        expect(game.verify_win).to eq([true, 0])
      end
    end
  end
end
