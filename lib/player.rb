require 'pry'

class Player

	attr_accessor :name, :life_points

	def initialize(update_name)
		
		@name = update_name.to_s
		@life_points = 20
	end

	def display_stats
		if @life_points <= 0
			puts "#{@name} est mort. GAME OVER !!"
		else
		puts " Le joueur #{@name} possède #{@life_points} HP."
		end
	end

	def gets_damage(dmg_inflicted)
		@life_points = @life_points - dmg_inflicted
		puts "#{@name} subit #{dmg_inflicted} point de dégats."
		
		if @life_points <= 0
			puts "#{@name} est mort. GAME OVER !!"
		else
		puts "#{@name} a #{@life_points} HP."
	end
	end

	def compute_dmg
		@dmg = rand(1...9)
	end

	def attacks(a =[])
		
		puts "#{self.name} attaque #{a.name} et lui inflige #{@dmg1 = compute_dmg} dégats."
		a.gets_damage(@dmg1)
	end

	
end

#binding.pry
#puts 'end of file'