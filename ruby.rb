class Cookbook
  attr_accessor :recipies
  def initialize
    @recipies = []
  end

  def add_recipe(recipe)
    @recipies << recipe
  end

  def to_s
    final_string = ""
    @recipies.each do |x|
      final_string += "#{x}\n===========\n"
    end
    final_string
  end

  def list
    final_string = ""
    @recipies.each do |recipe|
      final_string += "#{recipe.title}: ingredients: #{recipe.ingredients.length} steps: #{recipe.steps.length}\n"
    end
    final_string
  end

  def find_ingredients(*ingredients)
    ingredient_list = []
    ingredients.each do | x |
      x.find_ingredient()
    end
  end

  def find_ingredient(ingredient)
    list = ""
    @recipies.each do | x |
      list += "#{x}" if x.find_ingredient?(ingredient)
    end
    list == "" ? "This ingredient can't be found." : list
  end
end

class Recipe
  attr_accessor :title, :ingredients, :steps
  def initialize(title, ingredients, steps)
    @title = title
    @ingredients = ingredients
    @steps = steps
  end

  def ary_to_s(ary)
    final_string = ""
    ary.each do |x|
      final_string += "#{x}\n"
    end
    final_string
  end

  def find_ingredient?(ingredient)
    @ingredients.include?(ingredient)
  end

  def to_s
    "#{title}\nIngredients:\n#{ary_to_s(ingredients)}\nSteps:\n#{ary_to_s(steps)}"
  end
end

recipe = Recipe.new("Pancakes", ["eggs", "milk", "flour", "blueberries", "water"],["Mix ingredients", "Heat pan", "pour", "cook", "eat"])
recipe2 = Recipe.new("derp", ["blarg", "eggs"], ["herp"])
cookbook = Cookbook.new
cookbook.add_recipe(recipe)
cookbook.add_recipe(recipe2)


puts cookbook.find_ingredient("eggs")
