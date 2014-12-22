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

get '/spells-a/' do
	erb :'spells-a'
end

get '/classes/' do 
	erb :classes
end

get '/about/' do 
	erb :about
end
