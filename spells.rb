require 'json'
require 'pp'

class Spells
  def initialize()
  	puts "READ SPELLS"
	json = File.read('spells.json')
	@allSpells = JSON.parse(json)
	@allSpells.each {|spell, value|
		puts "#{value['name']} incant is #{value['i']}" }
  end

  def allSpells()
  	return @allSpells
  end

end

