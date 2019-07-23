class Player
    attr_accessor :name, :life_points
    
    
    
    def initialize(name)
       @name = name 
       @life_points = 10
         
    end

    def show_state
        if @life_points > 0
            puts "#{@name} a #{@life_points} points de vie"
        else
            puts "#{@name} est mort"
        end
       
       
    end

    def gets_damage(damages)
        @life_points = @life_points - damages
        
        if @life_points <= 0
            puts "#{@name} à été tué"
        end
    end

    def attacks(player)
       puts "Le joueur #{@name} attaque #{player.name}"
       damages = compute_damage
       puts "Il lui inflige #{damages} points de dommages"
       player.gets_damage(damages)
    end

    def compute_damage
        return rand(1..6)
    end
end

class HumanPlayer < Player
        attr_accessor :weapon_level
    
        def initialize(name)
            @weapon_level = 1
            @life_points = 100
            @name = name 
        end

    def show_state
        if @life_points > 0
            puts "#{@name} a #{@life_points} points de vie et une baguette de niveau #{@weapon_level}"
        else
            puts "#{@name} est mort"
        end
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        rand_weapon = rand(1..6)
        new_weapon = rand_weapon
        puts "Tu as trouvé une baguette de niveau #{new_weapon}"
        if new_weapon > @weapon_level
            @weapon_level = new_weapon
            puts "En voilà une jolie baguette"
        else
            puts "Jamais vu quelqu'un d'aussi peu chanceux, tu dois être un Weasley"
        end
    end

    def search_health_pack
        rand_health = rand(1..6)
        case rand_health
            when 1
                puts "cheh !"
            when 2..5
                @life_points += 50
                if @life_points <= 100
                    puts "Bravo, la bave de crapaud te rapporte 50 hp"
                else
                    @life_points = 100
                    puts "Bravo la bave de crapaud te rapporte 50 hp"
                end
            else
                @life_points += 80
                if @life_points <= 100
                    puts "Bravo, le phoenix te soigne et t'offre 80 hp"
                else
                    @life_points = 100
                    puts "Bravo, le phoenix te soigne et t'offre 80 hp"
                end
        end


    end


        
        

    


end