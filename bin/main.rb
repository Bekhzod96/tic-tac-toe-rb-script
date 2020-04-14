# !/usr/bin/env ruby
puts '                                      Hello Welcome to Tic Tac Toe            '
puts 'This game for two person. For playing game insert gamers nic! '

print 'Player #1: '
player1 = gets.chomp

print 'Player #2: '
player2 = gets.chomp
puts "Great #{player1} vs #{player2}, Let\'s get started!"
puts '                                     Choose you sign in dashboard X || O '
x = false
print "Player #{player1} make a chooce: "
chooce = gets.chomp
while chooce != 'X' && chooce != 'O'
  print "#{player1} please choose out of given option:  "
  chooce = gets.chomp
end
chooce == 'X' ? x = true : nil
sign = {}
if x
  puts "#{player2} - O vs #{player1} - X"
  sign[player1] = 'X'
  sign[player2] = 'O'
else
  puts "#{player2} - X vs #{player1} - O "
  sign[player1] = 'O'
  sign[player2] = 'X'
end
board = {
  1 => '1', 2 => '2', 3 => '3',
  4 => '4', 5 => '5', 6 => '6',
  7 => '7', 8 => '8', 9 => '9'
}

def display_board(board)
  " Result of the move
#{board[1]} | #{board[2]} | #{board[3]} \n
#{board[4]} | #{board[5]} | #{board[6]} \n
#{board[7]} | #{board[8]} | #{board[9]} "
end

puts display_board(board)
def move(player_name, board, sign)
  print "Player \"#{player_name}\" is your turn, choose position from board: "
  choise = gets.chomp.to_i
  while board[choise].nil? || (board[choise] == 'X' || board[choise] == 'O')
    print 'Enter available position:'
    choise = gets.chomp.to_i
  end

  board[choise] = sign[player_name]
  puts display_board(board)
  puts rand(0..9) % 2.zero? ? 'Great this was winnig move!' : 'Ovv it has been drawing move!'
  board
end

player1_turn = true

9.times do
  if player1_turn
    board = move(player1, board, sign)
    player1_turn = false
  else
    board = move(player2, board, sign)
    player1_turn = true
  end
end

puts '                       Finish!'
puts 'Great job you Win!'
