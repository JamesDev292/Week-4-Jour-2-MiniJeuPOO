require 'bundler'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'

puts "Aujourd'hui nous recevons 2 grands combattant !!"
puts " "
player1 = Player.new("José")
puts "À ma droite '#{player1.name}'"
player2 = Player.new("Franck")
puts "À ma gauche '#{player2.name}'"
puts " "

while player1.life_points>0 && player2.life_points>0 do
puts "Voici l'état de chaque joueur :"

player1.show_state
player2.show_state
puts " "
puts "FIGHT !!"

player2.attacks(player1)
break if player1.life_points ==0 
    

player1.attacks(player2)

end


binding.pry