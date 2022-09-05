require "rspec"
require "./lib/dish"
require "./lib/potluck"

RSpec.describe Potluck do

  before(:each) do
    @potluck = Potluck.new("7-13-18")
    @couscous = Dish.new("Couscous Salad", :appetizer)
    @cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    @summer_pizza = Dish.new("Summer Pizza", :appetizer)
    @roast_pork = Dish.new("Roast Pork", :entre)
    @candy_salad = Dish.new("Candy Salad", :dessert)
    @bean_dip = Dish.new("Bean Dip", :appetizer)
  end

  describe "#initialize" do
    it "exists" do
    expect(@potluck).to be_an_instance_of(Potluck)
    end

    it "has readable date and dish atributes" do
      expect(@potluck.date).to eq("7-13-18")
      expect(@potluck.dishes).to eq([])
    end
  end

  describe "#add_dish" do
    it "adds a dish to the dishes array" do
      expect(@potluck.dishes).to eq([])
      @potluck.add_dish(@couscous)
      expect(@potluck.dishes).to eq([@couscous])
      @potluck.add_dish(@cocktail_meatballs)
      expect(@potluck.dishes).to eq([@couscous, @cocktail_meatballs])
      expect(@potluck.dishes.length).to eq(2)
    end
  end

  describe "#get_all_from_category" do
    it "creates a new array containing all dishes from a specified category" do
      expect(@potluck.dishes).to eq([])
      @potluck.add_dish(@couscous)
      @potluck.add_dish(@summer_pizza)
      @potluck.add_dish(@roast_pork)
      @potluck.add_dish(@cocktail_meatballs)
      @potluck.add_dish(@candy_salad)
      expect(@potluck.dishes).to eq([@couscous, @summer_pizza, @roast_pork, @cocktail_meatballs, @candy_salad])
      expect(@potluck.get_all_from_category(:appetizer)).to eq([@couscous, @summer_pizza])
      expect(@potluck.get_all_from_category(:appetizer).first).to eq(@couscous)
      expect(@potluck.get_all_from_category(:appetizer).first.name).to eq("Couscous Salad")
    end
  end

  describe "#menu" do
    it "contains a category hash containing an alphabetized array of dish names" do
    @potluck.add_dish(@couscous)
    @potluck.add_dish(@summer_pizza)
    @potluck.add_dish(@roast_pork)
    @potluck.add_dish(@cocktail_meatballs)
    @potluck.add_dish(@candy_salad)
    @potluck.add_dish(@bean_dip)
    expect(@potluck.dishes).to eq([@couscous, @summer_pizza, @roast_pork, @cocktail_meatballs, @candy_salad, @bean_dip])
# require "pry";binding.pry
    expect(@potluck.menu).to eq({
                                  :appetizers => ["Bean Dip", "Couscous Salad", "Summer Pizza"],
                                  :entres => ["Cocktail Meatballs", "Roast Pork"],
                                  :desserts => ["Candy Salad"]
                                })
    end
  end

  describe "#ratio" do
    it "will output the float percentage (to the tenth) of the called category out of all categories" do
      @potluck.add_dish(@couscous)
      @potluck.add_dish(@summer_pizza)
      @potluck.add_dish(@roast_pork)
      @potluck.add_dish(@cocktail_meatballs)
      @potluck.add_dish(@candy_salad)
      @potluck.add_dish(@bean_dip)
      expect(@potluck.dishes).to eq([@couscous, @summer_pizza, @roast_pork, @cocktail_meatballs, @candy_salad, @bean_dip])
      expect(@potluck.ratio(:appetizer)).to eq(50.0)
    end
  end
end
