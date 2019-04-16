# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout


# lignes qui appellent les fichiers lib/user.rb et lib/event.rb
# comme ça, tu peux faire User.new dans ce fichier d'application. Top.
require_relative 'lib/player'
require_relative 'lib/game'


### Debut JEU / CREATION / JOUEURS
##
#

def game_creation_joueurs
	puts " \n\n> Bienvenue dans Mortal Combat, THP mode V.2 !!\n
Vous allez pouvoir niker des mères en toute tranquillité \ndans des combats d'une extrème violence.\n
	Entrez votre nom : "
	print " \n>"
	@name1 = gets.chomp.to_s
	if @name1.length >= 1
		@player1 = HumanPlayer.new("#{@name1}")
	end
	
	
end

#
##
### Fin JEU / CREATION / JOUEURS

### Debut JEU / CREATION / BOTS
##
#

def game_creation_bots

	@bot1 = Player.new("Gertrude")
	@bot2 = Player.new("Solange")
	
end

#
##
### Fin JEU / CREATION / BOTS

### Debut JEU / INTRO
##
#

def game_intro
	puts "\n\nWelcome #{@name1} !! \nTes adversaires du jour sont 2 nymphomanes assoifées de sang.\nBonne chance à toi.
	\n\n Voici le status des joueurs :\n\n"
	puts "
	#{@player1.display_stats}
	#{@bot1.display_stats}
	#{@bot2.display_stats}"

	puts " Press Enter pour démarrer le combat !!"
	gets.chomp

end

#
##
### Fin JEU / INTRO


### Debut JEU / COMBAT
##
#

def game_combat
# DEBUT BOUCLE
	while @player1.life_points > 0

		puts "\n ---------------\nVoici votre statut #{@name1}:" 
		puts "#{@player1.display_stats}\n"
		puts " Statut des ennemis :"
		puts "#{@bot1.display_stats}
	#{@bot2.display_stats}"
		puts "Que décidez-vous de faire ?\n\n Action secondaires : \na - Chercher une meilleure arme\ns - Se soigner\n\n Attaquer:\n0 - Attaquer Gertrude\n1 - Attaquer Solange "
		puts " \n> Tappez votre choix"
	 	choix1 = gets.chomp
		if choix1 == "a" 
			@player1.search_weapon
		elsif choix1 == "s"
			@player1.search_hp
		elsif choix1 == "0"
			@player1.attacks(@bot1)
			@bot1.life_points
		elsif choix1 == "1"
			@player1.attacks(@bot2)
			@bot2.life_points
		else
			puts "T'as merdé, tu perds ton tour, Press Enter !"
			gets.chomp
		end
	
	
	puts "\n\n C'est au tour de la Team Nympho d'attaquer !!\n\n"
		if @bot1.life_points > 0
			@bot1.attacks(@player1)
		else
			puts "#{@bot1.name} est mort et ne peut pas attaquer."
		end
		if @bot2.life_points > 0
			@bot2.attacks(@player1)	
		else
			puts "#{@bot2.name} est mort et ne peut pas attaquer."
		end
		
	break if (@bot1.life_points <= 0 && @bot2.life_points <= 0)
	
	end
# FIN BOUCLE
	
	if @player1.life_points <= 0
		puts "\n\n YOU LOSE (espèce de grosse merde) !!!\n\n Victoire écrasante du duo des Nympo !!\n"
	else
		puts "\n\n YOU WIIIN !!! T'es trop un Beau Gosse #{@name1}!\n\n!! Yeaaah !!"
		
	end
	puts "\n\n Press Enter pour sortir"
	gets.chomp
end

#
##
### Fin JEU / COMBAT

### Debut PERFORM
##
#

def perform
	game_creation_joueurs
	game_creation_bots
	game_intro
	game_combat

end


perform

#
##
### Fin PERFORM











