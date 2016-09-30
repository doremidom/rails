require 'sinatra'
require 'sinatra/reloader'

number = rand(100)

if @guesses == 0
	number = rand(100)
	@guesses = 5
end

message = ""
@@guesses = 5

def check_guess(guess, number)
	if guess.nil?
		message = "empty"
	else
		guess = guess.to_i
		
		if guess > number
			if guess - number > 5
				message = "Way tooooo high! #{guess}"
			else
				message = "Too high!"
			end
		elsif guess < number
			if number - guess > 5
				message = "Way too low!"
			else
				message = "Too low!"
			end
		else
			message = "You got it right!"
		end
		@@guesses -= 1
	end

	message
end

cheat = false


get '/' do
	guess = params["guess"]
	if params["cheat"]
		cheat = true
	end
	message = check_guess(guess, number)
	
	if @@guesses == 0
		number = rand(100)
		@@guesses = 5
		message = "You've lost, the number has been reset."
		cheat = false
	elsif message == "You got it right!"
		number = rand(100)
		@@guesses = 5
		cheat = false
		message = "You got it right! Number has been reset."
	end
	erb :index, :locals => {:number => number, :message => message, :cheat => cheat}
end

