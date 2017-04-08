require 'sinatra'
require 'sinatra/reloader'


class GuessingGame
	attr_accessor :guesses_remaining, :secret_number, :message, :background_color

	SECRET_NUMBER = rand(100)

	def initialize
		@guesses_remaining = 5
		@secret_number = rand(100)
		@message = "Guess a number!"
		@background_color = "white"	
		@game_state = :playing	
	end

	def check_guess(guess)
		guess = guess.to_i
		result = :none
		case
		when guess == 0		
			result = :none
		when guess > @secret_number + 5
			result = :high_high
		when guess > @secret_number
			result = :high
		when guess < @secret_number - 5
			result = :low_low
		when guess < @secret_number
			result = :low
		when guess == @secret_number
			result = :correct
		end
		@background_color = background_color_select(result)
		@message = message_select(result)
	end

	def background_color_select(result)
		case result
		when :high_high
			"#f44265"
		when :high
			"#f98ea3"
		when :low_low
			"#3ba5f7"
		when :low
			"#a7d5f9"
		when :correct
			"#dff28c"
		else
			"white"
		end
	end

	def message_select(result)
		case result
		when :high_high
			"Your guess is WAY too high!"
		when :high
			"Your guess is too high!"
		when :low_low
			"Your guess is WAY too low!"
		when :low
			"Your guess is too low!"
		when :correct
			"Your guess is correct!"
		else
			"Guess a number please!"
		end
	end
end

GAME = GuessingGame.new

get '/' do
	guess = params['guess']
	GAME.check_guess(guess)


	hint = GAME.check_guess(guess)
	message = GAME.message_select(hint)
	background_color = GAME.background_color_select(hint)


	erb :index, :locals => {:secret_number => GAME.secret_number, :guesses_remaining => GAME.guesses_remaining, :message => GAME.message, :background_color => GAME.background_color}
end

