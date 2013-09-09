#By Justin Blaisdell and Bonnie Mattson 

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
    list = ""
    result = []
    @recipies.each do | x |
      ingredients.each do |y|
        result << x.find_ingredient?(y)
      end
      unless result.include?(false)
        list += "#{x}"
      end
    end
    list == "" ? "This ingredient can't be found." : list
  end

  def goes_with (recipe)
    dish = recipe.dish
    meal = recipe.meal
    options = ""
    @recipies.each do |y|
      if (y.dish <=> dish) != 0
       options += "#{y.title} \n" if (y.meal <=> meal) == 0
       puts "goes with!"
      end 
    end
    return "#{recipe.title} goes well with: \n #{options}"
  end
end

class Recipe
  attr_accessor :title, :ingredients, :steps 
  attr_reader :meal, :dish
  def initialize(title, ingredients, steps, meal=nil, dish = nil)
    @title = title
    @ingredients = ingredients
    @steps = steps
    @meal = meal
    @dish = dish
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
  private
  def add_dish(dish)
    @dish = dish
  end

  def add_meal(meal)
    @meal = meal
  end
end

recipe = Recipe.new("Pancakes", ["eggs", "milk", "flour", "blueberries", "water"],["Mix ingredients", "Heat pan", "pour", "cook", "eat"], "breakfast", "main")
recipe2 = Recipe.new("derp", ["blarg", "eggs"], ["herp"])
recipe3 = Recipe.new("bacon", ["bacon", "more bacon"], ["bake-'un"], "breakfast", "side")
recipe4 = Recipe.new("sandwich", ["bread", "lettuce", "bacon", "tomato"], ["make me one"], "lunch", "main")
recipe5= Recipe.new("waffles", ["flour", "milk", "egg"], ["mix ingredients", "pour some into waffle iron"], "breakfast", "main")
cookbook = Cookbook.new
cookbook.add_recipe(recipe)
cookbook.add_recipe(recipe2)
cookbook.add_recipe(recipe3)
cookbook.add_recipe(recipe4)
cookbook.add_recipe(recipe5)


puts cookbook.goes_with(recipe3)
