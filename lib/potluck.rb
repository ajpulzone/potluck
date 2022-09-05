require "./lib/dish"

class Potluck
  attr_reader :date, :dishes, :menu

  def initialize(date, dishes = [])
    @date = date
    @dishes = []
    @menu = {}
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    dishes.select do |dish|
    dish.category == category
    end
  end

  def menu
    sorted = @dishes.sort_by do |dish|
      dish.name
    end

    menu = {
        :appetizers => [],
        :entres => [],
        :desserts => []
      }
    #hash_name[Key] = VALUE
    sorted.each do |dish|
      if dish.category == :appetizer
        menu[:appetizers] << dish.name
      elsif dish.category == :entre
        menu[:entres] << dish.name
      elsif dish.category == :dessert
        menu[:desserts] << dish.name
      end
    end
    menu
  end

  def ratio(category)
    (get_all_from_category(category).length.to_f / @dishes.length * 100).round(1)
  end
end






      #easier to alphabetize the dishes first

      #iterate through the potluck.dishes array
      #for each dish return dish.category as the hash key
      #feach key stores an array of dish names for those dishes that are of the matching category
      #Will be a hash (key = category, value = dish name)
      # @potluck.get_all_from_category
      # dishes.hash do |dish|
      # menu = {:category => [dish.name]}
