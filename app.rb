# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout


# lignes qui appellent les fichiers lib/user.rb et lib/event.rb
# comme ça, tu peux faire User.new dans ce fichier d'application. Top.
require_relative 'lib/player'
require_relative 'lib/game'


# Maintenant c'est open bar pour tester ton application. Tous les fichiers importants sont chargés
# Tu peux faire User.new, Event.new, binding.pry, User.all, etc.
# 




def game_creation_joueurs
	puts " > Bienvenue dans Mortal Combat, THP mode.
	Entrez les noms des deux combattants: "
	print " \n>"
	@name1 = gets.chomp.to_s
	print " \n>"
	@name2 = gets.chomp.to_s

	@player1 = Player.new("#{@name1}")
	@player2 = Player.new("#{@name2}")
end

def game_intro
	puts "\n\nLes deux combattants vont à présent entrer dans la cage !!\n
	Mesdames & Messieurs !!! \n\nJ'ai l'immense honneur de vous présenter ...... #{@name1} !!!
Dit, #{@name1} le Rédoutable ! Il a un zgeg de 47 cm !!"
	

puts " \n\nEt son adversaire de ce soir, à ce jour invaincu dans la ligue: \nMortal Combat THP mode.
\nJ'appelle..... #{@name2} le TERRIBLE !!!!  
Il est connu et redouté par ses adversaires à cause de la taille de ses narines !!\n"
end


def game_lancement_combat
	puts "\n Voici l'état des joueurs :\n\n "
	puts "#{@player1.display_stats}\n #{@player2.display_stats}"
	puts "\n\n Press Enter pour démarrer le combat !!"
	gets.chomp
	
end

def game_combat
	
	while @player1.life_points > 0 && @player2.life_points > 0

		puts "\n\n C'est au tour de #{@name1} d'attaquer !!\n"
		@player1.attacks(@player2)
		@player1.life_points
		break if @player1.life_points <= 0 || @player2.life_points <= 0
		puts "\n\n C'est au tour de #{@name2} d'attaquer !!\n"
		@player2.attacks(@player1)
		@player2.life_points
		

	end
	
	if @player1.life_points <= 0
		puts "\n\n Fin du combat !!!\n\n Victoire écrasante du joueur #{@name2} !!!!\n Il a exterminé #{@name1} le faible o/"
	else
		puts "\n\n Fin du combat !!!\n\n Victoire écrasante du joueur #{@name1} !!!!\n Il a arraché les couilles de #{@name2} !! Yeaaah !!"
		
	end
	puts "\n\n Press Enter pour sortir"
	gets.chomp
end

def perform
	game_creation_joueurs
	game_intro
	game_lancement_combat
	game_combat

end


perform




