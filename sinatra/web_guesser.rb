require 'sinatra'
require 'sinatra/reloader'

number = rand(100)
message = ""

def check_guess(guess, number)
	if guess == ""
		return message = ""
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
	end
	message
end


get '/' do
	guess = params["guess"]
	message = check_guess(guess, number)
	erb :index, :locals => {:number => number, :message => message}
end

