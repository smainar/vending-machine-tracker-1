require "rails_helper"

RSpec.describe "Snack Show Page", type: :feature do
  before(:each) do
    @owner = Owner.create(name: "Sam's Snacks")
    @dons  = @owner.machines.create(location: "Don's Mixed Drinks")

    @snack_1 = @dons.snacks.create(name: "White Castle Burger", price: 3.50)
    @snack_2 = @dons.snacks.create(name: "Pop Rocks", price: 1.50)
    @snack_3 = @dons.snacks.create(name: "Flaming Hot Cheetos", price: 2.50)
  end

  it "I see the name, price, and vending machine locations for that snack" do
    visit snack_path(@snack_1)

    expect(page).to have_content(@snack_1.name)
    expect(page).to have_content("Price: $#{@snack_1.price}")

    expect(page).to_not have_content(@snack_2.name)
    expect(page).to_not have_content("Price: $#{@snack_2.price}")
  end
end
