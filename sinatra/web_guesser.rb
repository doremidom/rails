require 'sinatra'
require 'sinatra/reloader'

number = rand(1..100)
message = ""

def check_guess(guess, number)
	guess = guess.to_i
	if guess == 0
		message = ""
	elsif guess > number
		if guess - number > 5
			message = "Way too high!"
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
	message
end


get '/' do
	guess = params["guess"]
	message = check_guess(guess, number)
	erb :index, :locals => {:number => number, :message => message}
end

