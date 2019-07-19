require "rails_helper"

RSpec.describe "Vending Machine Show Page", type: :feature do
  before(:each) do
    @owner = Owner.create(name: "Sam's Snacks")
    @dons  = @owner.machines.create(location: "Don's Mixed Drinks")

    @snack_1 = @dons.snacks.create(name: "White Castle Burger", price: 3.50)
    @snack_2 = @dons.snacks.create(name: "Pop Rocks", price: 1.50)
    @snack_3 = @dons.snacks.create(name: "Flaming Hot Cheetos", price: 2.50)
  end

  it "I see the name of all of the snacks associated with that vending machine along with their price" do
    visit machine_path(@dons)

    within("#snacks-#{@snack_1.id}") do
      expect(page).to have_content("#{@snack_1.name}: $#{@snack_1.price}")
    end

    within("#snacks-#{@snack_2.id}") do
      expect(page).to have_content("#{@snack_2.name}: $#{@snack_2.price}")
    end
  end

  it "I also see an average price for all of the snacks in that machine" do
    visit machine_path(@dons)

    expect(page).to have_content("Average Price: $2.50")
  end
end
