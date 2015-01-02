require 'sinatra' 
require_relative 'spells'

spells = Spells.new()

set :bind, '0.0.0.0'
set :port, 1337

get '/' do 
	erb :home
end

get '/index.html' do 
	erb :home
end

get '/spells/' do 
	erb :spells
end

get '/armor/' do 
	erb :armor
end

get '/combat/' do 
	erb :combat
end

get '/weapons/' do 
	erb :weapons
end

get '/shields/' do 
	erb :shields
end

get '/states/' do 
	erb :states
end

get '/reeves/' do 
	erb :reeves
end

get '/spells/:letter' do
	@reducedHash = spells.allSpells().reject {|k,v| k[0] != params[:letter]}
	erb :"spell-byletter"
end

get '/classes/' do 
	erb :classes
end

get '/about/' do 
	erb :about
end
