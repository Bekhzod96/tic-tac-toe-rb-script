# game_logic section

class Player
  attr_reader :name, :sign
  attr_writer :sign

  def initialize(name)
    @name = name
    @sign = ''
  end
end

class Game
  attr_accessor :board, :p1, :p2, :sign
  def initialize(player1_name, player2_name,sign)
    @board = { 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9' }
    @p1 = Player.new(player1_name)
    @p2 = Player.new(player2_name)
    @track = true
    add_player_sign(sign)
  end

  def add_player_sign(sign)
    if sign == 'X'
      @p1.sign = 'X'
      @p2.sign = 'O'
    else
      @p1.sign = 'O'
      @p2.sign = 'X'
    end
  end

  def display
    "  \nResult of the move\n
    #{@board[1]} | #{@board[2]} | #{@board[3]} \n
    #{@board[4]} | #{@board[5]} | #{@board[6]} \n
    #{@board[7]} | #{@board[8]} | #{@board[9]} "
  end

  def update_board(move)
    if @track
      @board = move.call(@p1.name, @board, @p1.sign)
      @track = false
    else
      @board = move.call(@p2.name, @board, @p2.sign)
      @track = true
    end
  end

  def check_win?
    result = []
    winnig = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    winnig.each do |arr|
      sign = ''
      arr.each_with_index do |value, index|
        if (@board[value] == 'X' || @board[value] == 'O') && index.zero?
          sign = @board[value]
        elsif sign == @board[value]
          return result = [true, sign] if index == 2

          next
        else
          break
        end
      end
    end
    result
  end

  def draw?
    draw = true
    board.each_with_index do |value, index|
      break draw = false if index == 8
      value[1] == 'X' || value[1] == 'O' ? next : break
    end
    draw
  end
end
