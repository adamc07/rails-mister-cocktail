
require 'json'
require 'open-uri'

Ingredient.destroy_all

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_list = open(url).read
data_hash = JSON.parse(ingredient_list)

data_hash['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end




