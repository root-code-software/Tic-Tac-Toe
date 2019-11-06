# frozen_string_literal: true

require_relative '../lib/tic_tac_toe.rb'

RSpec.describe TicTacToe::GameEngine do
  let(:game) { TicTacToe::GameEngine.new('Israel', 'Izaias')}

  describe '#player1_name' do
    context 'Shows the correct name of player 1' do
      it do
        expect(game.player1_name).to eq('Israel')
      end
    end
  end
end
