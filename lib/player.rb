require 'pry'

### Début CREATION CLASS: PLAYER
##
#

class Player

	#VARIABLES
		attr_accessor :name, :life_points 	
	#VARIABLES
		
	# DEBUT INITIALIZE
		def initialize(update_name)
			
			@name = update_name.to_s
			@life_points = 20
		end
	# FIN INITIALIZE
		
	# DEBUT AFFICHAGE STATS
		def display_stats
			if @life_points <= 0
				puts "#{@name} est mort."
			else
			puts " Le bot #{@name} possède #{@life_points} HP."
			end
		end
	# FIN AFFICHAGE STATS

	# DEBUT CREATION: INFLIGER DOMMAGES
		def gets_damage(dmg_inflicted)
			@life_points = @life_points - dmg_inflicted
			puts "#{@name} subit #{dmg_inflicted} point de dégats."
			
			if @life_points <= 0
				puts "#{@name} est mort."
			else
			puts "#{@name} a #{@life_points} HP."
		end
		end
	# FIN CREATION: INFLIGER DOMMAGES

	# DEBUT CREATION: RANDOM DMG
		def compute_dmg
			@dmg = rand(1...9)
		end
	# FIN CREATION: RANDOM DMG
		
	# DEBUT CREATION: ATTAQUE
		def attacks(a =[])
			
			puts "#{self.name} attaque #{a.name} et lui inflige #{@dmg1 = compute_dmg} dégats."
			a.gets_damage(@dmg1)
		end
	# FIN CREATION: ATTAQUE
	
end

#
##
### Fin CREATION CLASS: PLAYER



class HumanPlayer < Player

attr_accessor :weapon_level

# DEBUT INITIALIZE
	def initialize(update_name)

		@life_points = 100
		@weapon_level = 1
		@name = update_name.to_s
		
	end
# FIN INITIALIZE	

# DEBUT AFFICHAGE STATS
	def display_stats
			if @life_points <= 0
				puts "#{@name} est mort. GAME OVER !!"
			else
			puts " Le joueur #{@name} possède #{@life_points} HP et une arme level #{@weapon_level}."
			end
	end
# FIN AFFICHAGE STATS

# DEBUT CREATION: RANDOM DMG
		def compute_dmg_1
			@dmg = rand(1...9)*@weapon_level
		end
# FIN CREATION: RANDOM DMG

# DEBUT CREATION: BUFF WEAPON
	def search_weapon
		@update_weapon_level = rand(1..6)
		puts "#{self.name} a trouvé une nouvelle arme de level #{@update_weapon_level}."
		if @update_weapon_level > @weapon_level
		@weapon_level = @update_weapon_level
		puts "#{self.name} aime la nouvelle arme, il l'équipe directement"
		else
		puts "La nouvelle arme pue la merde !! On la tèj direct !!" 
		end
		puts "#{self.name} a une arme de level #{@weapon_level}."
	end
# FIN CREATION: BUFF WEAPON


# DEBUT CREATION: BUFF HP

	def search_hp
		@update_hp_level = rand(1..6)
		puts "#{self.name} a trouvé une buff de santé de #{@update_hp_level}."
		if @update_hp_level == 1
			puts "C'est la hess ! pas de HP disponible."
			puts "#{self.name} a #{@life_points} HP."
		elsif @update_hp_level >= 2 && @update_hp_level <= 5
			puts "Pas trop dégueu, 50 HP."
			@life_points = @life_points + 50
			puts "#{self.name} a #{@life_points} HP."
			
		elsif @update_hp_level == 6
			puts "Jackpot mon pote: +80HP !!"
			@life_points = @life_points + 80
			puts "#{self.name} a #{@life_points} HP."
		end
	end
# FIN CREATION: BUFF HP

# DEBUT CREATION: ATTAQUE
		def attacks(a =[])
			
			puts "#{self.name} attaque #{a.name} et lui inflige #{@dmg1 = compute_dmg_1} dégats."
			a.gets_damage(@dmg1)
		end
	# FIN CREATION: ATTAQUE


end



#binding.pry
#{}"end of file"


