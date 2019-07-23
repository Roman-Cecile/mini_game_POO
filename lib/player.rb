class Player
    attr_accessor :name, :life_points
    
    @@life_points = 10
    
    def initialize(name)
       @name = name 
       @life_points = @@life_points
         
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