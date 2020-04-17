# rubocop:disable Lint/UselessAssignment

require './lib/game_logic.rb'
describe Game do
  subject { Game.new('PL1', 'PL2', 'O') }

  context '!draw?' do
    it 'draw need to return true' do
      subject.board = { 1 => 'X', 2 => '2', 3 => 'X', 4 => 'X', 5 => 'X', 6 => 'X', 7 => 'X', 8 => 'X', 9 => 'X' }
      expect(subject.draw?).to be_truthy
    end
  end

  context 'draw?' do
    it 'draw need to return false' do
      subject.board = { 1 => 'X', 2 => 'X', 3 => 'X', 4 => 'X', 5 => 'X', 6 => 'X', 7 => 'X', 8 => 'X', 9 => 'X' }
      should_not subject.draw?
    end
  end

  context 'check_win?' do
    it 'Winnnig condition' do
      subject.board = { 1 => 'X', 2 => '2', 3 => '3', 4 => '4', 5 => 'X', 6 => '6', 7 => '7', 8 => '8', 9 => 'X' }
      expect(subject.check_win?).to be
    end
  end

  context '!check_win?' do
    it 'Not Winnnig condition' do
      subject.board = { 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => 'X', 6 => '6', 7 => '7', 8 => '8', 9 => 'X' }
      expect(subject.check_win?).to eq([])
    end
  end

  context 'X sign' do
    it 'Player1 is X sign' do
      subject.add_player_sign('X')
      expect(subject.p1.sign).to eq('X')
    end
  end

  context 'update_board' do
    move = proc { board = { 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => 'X', 6 => '6', 7 => '7', 8 => '8', 9 => 'X' } }
    it 'it is updated board' do
      original_board = subject.board
      subject.update_board(move)
      expect(subject.board).to_not contain_exactly(original_board)
    end
  end
  # rubocop:enable Lint/UselessAssignment
end
