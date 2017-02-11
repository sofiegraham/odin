require "colorize"
require "yaml"

class Game
	attr_accessor :current_guess
	attr_reader :answer, :words, :game_status, :allowed_guesses, :game_string,
	:correct_letters, :incorrect_letters, :message_to_player

@@words = (File.readlines("5desk.txt").each { |word| word.gsub!(/\r|\n/, "").downcase })
@@words.reject! { |word| word.length < 5 || word.length > 12 }

	def initialize
		@answer = @@words.sample
		@allowed_guesses = 6
		@game_string = Array.new(answer.length) {"_"}
		@current_guess = 0
		@correct_letters = []
		@incorrect_letters = []
		@game_status = "playing"
		@message_to_player = ""
		game_loop
	end

	def game_loop
		until game_status == "ended"
			display_game
			check_string(gets.chomp.downcase)
			win_check
		end
		display_game
		exit
	end

	def display_game
		system "clear"
		puts "#{current_guess} out of #{allowed_guesses}"
		puts "Guess: #{game_string.join(" ")}".light_white
		puts "Correct: #{correct_letters.join(" ")}".light_cyan
		puts "Incorrect: #{incorrect_letters.join(" ")}".light_red
		puts @message_to_player
		puts "Pick a letter, 'SAVE' or 'LOAD':"
	end

	def check_string(letter)
		@message_to_player = ""
		if letter == "save"
			save_game
			@message_to_player = "GAME SAVED"
		elsif letter == "load"
			load_game
			@message_to_player = "GAME LOADED"
		elsif (letter =~ /[[:alpha:]]/) && (letter.length == 1) && (@correct_letters.include?(letter) ? false : true) && (@incorrect_letters.include?(letter) ? false : true)
			if answer.include?(letter)
				indexes = (0...answer.length).find_all { |i| answer[i] == letter }
				indexes.each { |i| game_string[i] = letter }
				@correct_letters << letter
				@message_to_player = "GOOD GUESS!"
			else
				@incorrect_letters << letter
				@message_to_player = "UH OH! TRY AGAIN, LOSER!"
				@current_guess += 1
			end	
		else
			@message_to_player = "PICK A NEW, SINGLE LETTER, MORON!"
		end
	end

	def win_check
		if @current_guess == @allowed_guesses
			@game_status = "ended"
			@message_to_player = "THE END! SORRY, DIPSHIT... THE ANSWER WAS #{@answer.upcase}"
		elsif @game_string.none? { |letter| letter == "_"}
			@game_status = "ended"
			@message_to_player = "A WINNER IS YOU!"
		end
	end

	def load_game
		data = YAML.load_file("save_game")
			@answer = data[:answer]
			@game_string = data[:game_string]
			@current_guess = data[:current_guess]
			@correct_letters = data[:correct_letters]
			@incorrect_letters = data[:incorrect_letters]
			@game_status = data[:game_status]
			@message_to_player = data[:message_to_player]
			@allowed_guesses = data[:allowed_guesses]
	end

	def save_game
		data = {
			:answer => @answer,
			:game_string => @game_string,
			:current_guess => @current_guess,
			:correct_letters => @correct_letters,
			:incorrect_letters => @incorrect_letters,
			:game_status => @game_status,
			:message_to_player => @message_to_player,
			:allowed_guesses => @allowed_guesses
		}
		File.open("save_game", "w") { |file| YAML.dump(data, file)}
	end
end

my_game = Game.new