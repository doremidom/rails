require 'sinatra'
require 'sinatra/reloader'

def secret_number
	rand(100)
end

x = secret_number

get '/' do
	"The SECRET NUMBER is #{x}"
end

