# !/usr/bin/env ruby
require './lib/game_logic'
move = proc do |player_name, board, sign|
  print "Player \"#{player_name}\" is your turn, choose position from board: "
  choice = gets.chomp.to_i
  while board[choice].nil? || (board[choice] == 'X' || board[choice] == 'O')
    print 'Enter available position:'
    choice = gets.chomp.to_i
  end

  board[choice] = sign
  board
end
puts '                      Hello Welcome to Tic Tac Toe            '
puts 'This game for two person. For playing game insert gamers nic! '

print 'Player #1: '
player1 = gets.chomp

print 'Player #2: '
player2 = gets.chomp
puts "Great #{player1} vs #{player2}, Let\'s get started!"
puts '                           Select you sign in dashboard X || O '

print "Player #{player1} it is your turn to select: "
player_sign = gets.chomp

while player_sign != 'X' && player_sign != 'O'
  print "#{player1} please choose out of given option:  "
  player_sign = gets.chomp
end
game = Game.new(player1, player2, player_sign)
puts game.display

while game.check_win?.empty? && game.draw?
  game.update_board(move)
  puts game.display
end

winner = game.check_win?

if !game.draw?
  puts 'Ohh, no one wins! It\'s a draw!'
else
  puts 'Finish!'
  if winner[1] == game.p1.sign
    puts "Great #{game.p1.name},  you win!"

  else
    puts "Great #{game.p2.name},  you win!"
  end
end
