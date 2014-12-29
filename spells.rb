require 'json'
require 'pp'

class Spells
  def initialize()
  	puts "READ SPELLS"
	json = File.read('spells.json')
	@allSpells = JSON.parse(json)
	percent = @allSpells.length / 161.0 * 100
	puts "Finished #{@allSpells.length} Spells of 161 (#{percent} complete)"
  end

  def allSpells()
  	return @allSpells
  end

end

