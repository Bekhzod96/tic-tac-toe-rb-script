# !/usr/bin/env ruby

def move(player_name, board, sign)
  print "Player \"#{player_name}\" is your turn, choose position from board: "
  choise = gets.chomp.to_i
  while board[choise].nil? || (board[choise] == "X" || board[choise] == "O")
    print "Enter available position:"
    choise = gets.chomp.to_i
  end

  board[choise] = sign[player_name]
  puts display_board(board)
  board
end

puts "                                      Hello Welcome to Tic Tac Toe            "
puts "This game for two person. For playing game insert gamers nic! "

print "Player #1: "
player1 = gets.chomp

print "Player #2: "
player2 = gets.chomp
puts "Great #{player1} vs #{player2}, Let\'s get started!"
puts "                                     Choose you sign in dashboard X || O "

print "Player #{player1} make a choice: "
player_sign = gets.chomp

while player_sign != "X" && player_sign != "O"
  print "#{player1} please choose out of given option:  "
  player_sign = gets.chomp
end

# game=Game.new("p1","x", "p2","o")
# call add_player_sign method

# call board class to
puts display_board(board)

# call game.looping_game
# winner = looping_game

# cal game.draw mehod
if !draw(board)
  puts "Ovv it has been drawing game!"
else
  puts "Finish!"
  if winner[1] == sign[player1]
    puts "Great #{player1} you win!"
  else
    puts "Great #{player2} you win!"
  end
end
