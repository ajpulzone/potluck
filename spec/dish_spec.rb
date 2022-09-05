require "rspec"
require "./lib/dish"

RSpec.describe Dish do

  before(:each) do
    @dish = Dish.new("Couscous Salad", :appetizer)
  end

  describe "#initialize" do
    it "exists" do
      expect(@dish).to be_an_instance_of(Dish)
    end

    it "has a name and a category" do
      expect(@dish.name).to eq("Couscous Salad")
      expect(@dish.category).to eq(:appetizer)
    end
  end

end












# require "rspec"
# require "lib/dish.rb"
# # require ""
#
# # RSpec.describe Potluck do
# #   before do
# #     @potluck = Potluck.new("7-13-18")
# #     @couscous_salad = Dish.new("Couscous Salad", :appetizer)
# #     @cocktail)meatballs
# #   end
# # end
