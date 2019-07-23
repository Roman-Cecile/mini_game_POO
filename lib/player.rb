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
    
        def initialize(get_name)
            @weapon_level = 1
            @life_points = 100
            @name = get_name 
        end

    def show_state
        if @life_points > 0
            puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
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
        puts "Tu as trouvé une arme de niveau #{new_weapon}"
        if new_weapon > @weapon_level
            @weapon_level = new_weapon
            puts "En voilà une belle nouvelle arme"
        else
            puts "Jamais vu quelqu'un d'aussi peu chanceux"
        end
    end

    def search_health_pack
        rand_health = rand(1..6)
        case rand_health
            when 1
                puts "cheh !"
            when 2..5
                @life_points + rand_health
                if @life_points <= 100
                    puts "Bravo, tu as remporté 50HP"
                else
                    @life_points = 100
                    puts "bravo tu as remporté 50HP"
                end
            else
                @life_points + rand_health
                if @life_points <= 100
                    puts "Bravo tu as remporté 80HP"
                else
                    @life_points = 100
                    puts "Bravo, tu as remporté 80HP"
                end
        end


    end


        
        

    


end