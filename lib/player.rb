
class Player
  attr_accessor :name, :life_points

  def initialize (name) # initialise les caractéristiques du personnage
    @name = name
    @life_points = 10
  end

  def show_state  #Affiche l'état de santé 
    puts"#{@name} a #{@life_points} point de vie"
  end

  def gets_damage (damage) #Applique les dégats 
    @life_points = @life_points - damage.to_i
    if @life_points <= 0
      @life_points = 0
    puts "le joueur #{@name} a été tué !" 
    else
      nil
    end
  end
  
  def attacks (player)    #L'attaque du joueur 
    puts "le joueur #{@name} attaque le joueur #{player.name}"
    damage_attack =  compute_damage
    puts "Il lui inflige #{damage_attack} points de dommages"
    player.gets_damage (damage_attack)
  end

  def compute_damage #Lancé de dé
    return rand(1..6)
  end
end



class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize (name)
    super(name) 
    @life_points = 100
    @weapon_level = 1
  end

  def show_state 
    puts"#{@name} a #{@life_points} point de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon   # Recherche une arme de meilleur niveau
    level_new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{level_new_weapon}."
    if level_new_weapon > @weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends !"
      @weapon_level = level_new_weapon
    else 
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
      nil
    end
  end

  def search_health_pack #Recherche ne potion de heal
    health_pack = rand(1..6)
    if health_pack == 1
      puts "Tu n'as rien trouvé... "
    elsif health_pack == 2..5
      @life_points += 50
      if @life_points > 100
        @life_points = 100
      end
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      
    else health_pack == 6
      @life_points += 80
      if @life_points > 100
        @life_points = 100
      end
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end
end