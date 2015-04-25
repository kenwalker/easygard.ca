require 'sinatra' 
require 'sinatra-logentries'

require_relative 'spells'

spells = Spells.new()

set :bind, '0.0.0.0'
set :port, 1337
set :environment, :production

configure do
	mime_type :appcache, 'text/cache-manifest'
end

configure do
	Sinatra::Logentries.token = 'e52c755c-a05b-4edd-b81c-e7a49b97b006'
end

logger.info("Starting up EasyGard.ca")

get '/' do 
	erb :home
end

get '/index.html' do 
	erb :home
end

get '/spells/' do 
	@allSpells = spells.allSpells()
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

get '/enchantments/' do
	@allSpells = spells.allSpells()
	erb :enchantments
end

get '/enchantments/self' do
	@allSpells = spells.allSpells()
	erb :"enchantments-self"
end

get '/enchantments/all' do
	@allSpells = spells.allSpells()
	erb :"enchantments-all"
end

get '/enchantments/touch' do
	@allSpells = spells.allSpells()
	erb :"enchantments-touch"
end

get '/enchantments/protection' do
	@allSpells = spells.allSpells()
	erb :"enchantments-protection"
end

get '/enchantments/flame' do
	@allSpells = spells.allSpells()
	erb :"enchantments-flame"
end

get '/enchantments/death' do
	@allSpells = spells.allSpells()
	erb :"enchantments-death"
end

get '/enchantments/sorcery' do
	@allSpells = spells.allSpells()
	erb :"enchantments-sorcery"
end

get '/enchantments/spirit' do
	@allSpells = spells.allSpells()
	erb :"enchantments-spirit"
end

get '/enchantments/yellow' do
	@allSpells = spells.allSpells()
	erb :"enchantments-yellow"
end

get '/enchantments/white' do
	@allSpells = spells.allSpells()
	erb :"enchantments-white"
end

get '/enchantments/red' do
	@allSpells = spells.allSpells()
	erb :"enchantments-red"
end

get '/classes/' do 
	erb :classes
end

get '/about/' do 
	erb :about
end
