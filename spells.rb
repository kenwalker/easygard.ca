require 'json'

class Spells
  def initialize()
	json = File.read('spells.json')
	@allSpells = JSON.parse(json)
  end

  def allSpells()
  	return @allSpells
  end

end

