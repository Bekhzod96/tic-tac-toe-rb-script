puts '                                      Hello Welcome to Tic Tac Toe            '
puts 'This game for two person. For playing game insert gamers nic! '

print 'Player #1: '
player_1 = gets.chomp

print 'Player #2: '
player_2 = gets.chomp
puts "Great #{player_1} vs #{player_2}, Let\'s get started!"
puts '                                     Choose you sign in dashboard X || O '
x = false
print "#{player_1} make a chooce: "
chooce = gets.chomp
while chooce != 'X' && chooce != 'O'
    print "#{player_1} please choose out of given option:  "
    chooce = gets.chomp
end
chooce == 'X' ? x = true : nil
puts x ? "#{player_2} will play with sign O vs #{player_1} with sign X" : "#{player_2} will play with sign X vs #{player_1} with sign O"



