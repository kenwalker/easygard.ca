require 'json'

class Battlegames
  def initialize()
	json = File.read('battlegames.json')
	@allBattlegames = JSON.parse(json)
  end

  def allBattlegames()
  	return @allBattlegames
  end

end

