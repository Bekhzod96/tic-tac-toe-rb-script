require './lib/game_logic.rb'
require './lib/player.rb'

RSpec.describe Game do
  let(:subject) { Game.new('PL1', 'PL2', 'O') }

  describe '#draw?' do
    it 'returns true if the game it\'s a draw' do
      subject.board = { 1 => 'X', 2 => '2', 3 => 'X', 4 => 'X', 5 => 'X', 6 => 'X', 7 => 'X', 8 => 'X', 9 => 'X' }
      expect(subject.draw?).to be_truthy
    end
    it 'returns false if the game it\'s not a draw' do
      subject.board = { 1 => 'X', 2 => 'X', 3 => 'X', 4 => 'X', 5 => 'X', 6 => 'X', 7 => 'X', 8 => 'X', 9 => 'X' }
      expect(subject.draw?).to be_falsey
    end
  end

  describe '#win?' do
    it 'returns true when win the game' do
      subject.board = { 1 => 'X', 2 => '2', 3 => '3', 4 => '4', 5 => 'X', 6 => '6', 7 => '7', 8 => '8', 9 => 'X' }
      expect(subject.check_win?).to be
    end
    it 'return false when loose the game' do
      subject.board = { 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => 'X', 6 => '6', 7 => '7', 8 => '8', 9 => 'X' }
      expect(subject.check_win?).to eq([])
    end
  end

  describe '#add_player' do
    it 'returns true when player1 got X sign' do
      subject.add_player_sign('X')
      expect(subject.p1.sign).to eq('X')
    end
  end

  describe '#update_board' do
    move = proc { { 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => 'X', 6 => '6', 7 => '7', 8 => '8', 9 => 'X' } }
    it 'returns true when is not the same board as original ' do
      original_board = subject.board
      subject.update_board(move)
      expect(subject.board).not_to contain_exactly(original_board)
    end
  end

  describe '#display_board' do
    it ' should not returns a nil class if the board is populated' do
      expect(subject.display).not_to be_a NilClass
    end
  end
end

RSpec.describe Player do
end
