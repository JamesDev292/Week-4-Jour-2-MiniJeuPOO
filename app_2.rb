require 'bundler'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'

puts"------------------------------------------------"
puts"|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts"|Le but du jeu est d'être le dernier survivant !|"
puts"-------------------------------------------------"

puts "Quel est ton nom de combattant ?"
print ">"
name_hero = gets.chomp
hero = HumanPlayer.new (name_hero)

players = []
enemie_1 = Player.new ("Tic")
enemie_2 = Player.new ("Tac")

players << enemie_1
players << enemie_2


while hero.life_points>0 && players.any? { |enemie| enemie.life_points > 0 }
    puts hero.show_state
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "Attaquer un joueur en vue :"
    print "0 - " 
    print enemie_1.show_state
    print "1 - " 
    print enemie_2.show_state
    print "> "
    choix = gets.chomp
    if choix == "a"
        hero.search_weapon
    elsif choix == "s"
        hero.search_health_pack
    elsif choix == "0"
        hero.attacks(enemie_1)
    elsif choix == "1"
        hero.attacks(enemie_2)
    else 
        choix = gets.chomp
    end
    puts "Les autres joueurs t'attaquent !"
    puts "--------------------------------"
    players.each do |enemie| 
        if enemie.life_points > 0
            enemie.attacks(hero)
        elsif enemie.life_points <=0
            puts "#{enemie.name} est mort !"
        end
    end
    gets.chomp
end

if hero.life_points <= 0
    puts "Tu as perdu !"
else players.all? { |enemie| enemie.life_points <= 0 }
    puts "Bravo, tu as gagné !!"
end

binding.pry