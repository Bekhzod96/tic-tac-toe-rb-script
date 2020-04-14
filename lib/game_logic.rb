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

  def update_board(position, sign)
    @board[position] = sign
  end
end

class Game
  p1 = Player.new("p1", "X")
  p2 = Player.new("p2", "O")
  player1_turn = true

  board = Board.new
  board.display

  # work tomorrow move method
  def move(player)
    print "Player \"#{player.name}\" is your turn, choose position from board: "
    choise = gets.chomp.to_i
    while board[choise].nil? || (board[choise] == "X" || board[choise] == "O")
      print "Enter available position:"
      choise = gets.chomp.to_i
    end

    board[choise] = sign[player_name]
    puts display_board(board)
    puts rand(0..9) % 2.zero? ? "Great this was winnig move!" : "Ovv it has been drawing move!"
    board
  end

  while !winner || !draw
    if player1_turn
      board = move(player1, board, sign)
      player1_turn = false
    else
      board = move(player2, board, sign)
      player1_turn = true
    end
  end

  private

  def winner; end

  def draw; end

  #   def free_position?

  #  end

  #   def available_position?
  #  end
end
