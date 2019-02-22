# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

file = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
ingredients = JSON.parse(file)

puts "Parsing the ingredients"

ingredients["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

file_path = open('https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail').read
JSON.parse(file_path)["drinks"].each do |cocktail|
  Cocktail.create(name: cocktail["strDrink"])
end

puts "Closing the ingredients"


