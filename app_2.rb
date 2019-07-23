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
enemies = [enemie1 = Player.new("Josiane") , enemie2 = Player.new("José")]
while humanplayer1.life_points > 0 && (enemie1.life_points > 0 || enemie2.life_points > 0)
    puts "Voici l'état de chaque combatant : "
    humanplayer1.show_state
    enemie1.show_state
    enemie2.show_state
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleur arme"
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
        humanplayer1.attacks(enemie1)
    elsif choice_action == "1"
        humanplayer1.attacks(enemie2)
    else 
        puts "Tu viens de perdre un tour, mamène"
        puts " "
    end
    
    puts "Au tour de tes ennemies"
    enemies.each do |enemie|
        enemie.attacks(humanplayer1)
        if humanplayer1.life_points <= 0
            break
        end
    end
end



if humanplayer1.life_points> (enemie1.life_points && enemie2.life_points)
    puts "Bravo, champion"
else
    puts "Et bah, on est pas sorti du sable avec des manches pareil"
end