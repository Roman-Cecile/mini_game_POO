require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "-------------------------------------------------------
            Bienvenue dans les Hunger Games           |
Votre seul mission, survivre quel qu'en soit le prix  | 
            Que le sort vous soit favorable           |
-------------------------------------------------------"

puts "Quel est le nom de votre héro ?"
human_name = gets.chomp
humanplayer1 = HumanPlayer.new(human_name)
enemies = [enemie1 = Player.new("Voldemort") , enemie2 = Player.new("Lucius Malfoy")]
while humanplayer1.life_points > 0 && (enemie1.life_points > 0 || enemie2.life_points > 0)
    puts " "
    puts "Voici l'état de chaque combatant : "
    humanplayer1.show_state
    enemie1.show_state
    enemie2.show_state
    puts " "
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts " "
    puts "Attaquer un joueur en vue :"
    print "0 -" 
    enemie1.show_state
    print "1 -" 
    enemie2.show_state
    
    choice_action = gets.chomp
    puts " "
    if choice_action == "a"
        humanplayer1.search_weapon
    elsif choice_action == "s"
        humanplayer1.search_health_pack
    elsif choice_action == "0"
        if enemie1.life_points <= 0
            puts "Tu l'as déjà défoncé, dommage"
        else
        humanplayer1.attacks(enemie1)
        end
    elsif choice_action == "1"
        if enemie2.life_points <= 0
            puts "Ce petit moldus est déjà KO, dommage"
        else
        humanplayer1.attacks(enemie2)
        end
    else 
        puts "Tu viens de perdre un tour, concentre-toi"
        puts " "
    end
    puts " "
    enemies.each do |enemie|
        if humanplayer1.life_points <= 0 || enemie.life_points <= 0
            break
        else
            puts "Au tour de tes ennemies"
            enemie.attacks(humanplayer1)
            end
            
        end
end





if humanplayer1.life_points> (enemie1.life_points && enemie2.life_points)
    puts "Bravo, champion"
else
    puts "Et bah, on est pas sorti du sable avec des manches pareil"
end