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
print "#{player1} make a chooce: "
chooce = gets.chomp
while chooce != 'X' && chooce != 'O'
  print "#{player1} please choose out of given option:  "
  chooce = gets.chomp
end
chooce == 'X' ? x = true : nil

puts x ? "#{player2} - O vs #{player1} - X" : "#{player2} - X vs #{player1} - O"

