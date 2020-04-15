# game_logic section

class Player
  attr_reader :name, :sign

  def initialize(name, sign)
    @name = name
    @sign = sign
  end
end

class Board
  def initialize
    @board = {
      1 => "1", 2 => "2", 3 => "3",
      4 => "4", 5 => "5", 6 => "6",
      7 => "7", 8 => "8", 9 => "9",
    }
  end

  def display_board
    " Result of the move
    #{@board[1]} | #{@board[2]} | #{@board[3]} \n
    #{@board[4]} | #{@board[5]} | #{@board[6]} \n
    #{@board[7]} | #{@board[8]} | #{@board[9]} "
  end
end

class Game
  def initialize(player1_name, player1_sign, player2_name, player2_sign)
    @player1_name = player1_name
    @player1_sign = player1_sign
    @player2_name = player2_name
    @player2_sign = player2_sign
  end

  @board = Board.new
  @p1 = Player.new(@player1_name, @player1_sign)
  @p2 = Player.new(@player2_name, @player2_sign)

  def looping_game?
    player1_turn = true
    while check_win(@board.board).empty? && draw(@board.board)
      if player1_turn
        board = move(@p1.name, board, @p1.sign)
        player1_turn = false
      else
        board = move(@p2.name, board, @p2.sign)
        player1_turn = true
      end
    end
    check_win(board)
  end

  def check_win(board)
    result = []
    winnig = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    winnig.each do |arr|
      sign = ""
      arr.each_with_index do |value, index|
        if (board[value] == "X" || board[value] == "O") && index.zero?
          sign = board[value]
        elsif sign == board[value]
          return result = [true, sign] if index == 2

          next
        else
          break
        end
      end
    end
    result
  end

  def draw(board)
    draw = true
    board.each_with_index do |value, index|
      break draw = false if index == 8
      value[1] == "X" || value[1] == "O" ? next : break
    end
    draw
  end

  def add_player_sign(player_sign, player1, player2)
    x = false
    player_sign == "X" ? x = true : nil
    sign = {}
    if x
      sign[player1] = "X"
      sign[player2] = "O"
    else
      sign[player1] = "O"
      sign[player2] = "X"
    end
  end
end
