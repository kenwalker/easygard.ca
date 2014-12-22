require 'sinatra' 

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

get '/states/' do 
	erb :states
end

get '/spells-a/' do
	erb :'spells-a'
end

get '/classes/' do 
	erb :classes
end

get '/about/' do 
	erb :about
end
