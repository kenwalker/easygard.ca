require 'json'
require 'pp'

json = File.read('spells.json')
spells = JSON.parse(json)
spells.each {|spell, value|
	puts "#{value['name']} incant is #{value['i']}" }
