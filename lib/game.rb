
class Game < Player 
  attr_accessor :human, :enemies
  enemies = []
  
  human = Game.new("Wolverine")
  enemie1 = Game.new("Joe")
  enemie2 = Game.new("Jack")
  enemie3 = Game.new("Claude")
  enemie4 = Game.new("Karl")

  enemies << enemie1
  enemies << enemie2
  enemies << enemie3
  enemies << enemie4

  def kill_player (player)
      player.delete
  end

  def is_still_ongoing?
      if human.life_points>0 || enemies.any? { |enemie| enemie.life_points > 0 }
          true
      else
          false
      end
  end


  def show_players
      print "1) "
      print hero.show_state
      print "2) "
      print enemies.count
  end

  def menu
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "Attaquer un joueur en vue :"
    print "0 - " 
    print enemie1.show_state
    print "1 - " 
    print enemie2.show_state
    print "> "
    print enemie3.show_state
    print "> "
    print enemie_4.show_state
    print "> "
    choix = gets.chomp
    if choix == "a"
      hero.search_weapon
    elsif choix == "s"
      hero.search_health_pack
    elsif choix == "0"
      hero.attacks(enemie1)
    elsif choix == "1"
      hero.attacks(enemie2)
    elsif choix == "2"
      hero.attacks(enemie3)
    elsif choix == "3"
      hero.attacks(enemie4)
    else 
      choix = gets.chomp
    end
  
    puts "Les autres joueurs t'attaquent !"
    puts "--------------------------------"
    enemies.each do |enemie| 
      if enemie.life_points > 0
          enemie.attacks(hero)
      elsif enemie.life_points <=0
          enemie.kill_player
          puts "#{enemie.name} est mort !"
      end
    end
  gets.chomp
  end
  
def end
  if hero.life_points <= 0
    puts "Tu as perdu !"
else players.all? { |enemie| enemie.life_points <= 0 }
    puts "Bravo, tu as gagné !!"
end
end

end

