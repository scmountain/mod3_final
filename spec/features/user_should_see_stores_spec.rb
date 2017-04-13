require 'rails_helper'

feature "as a user" do
  scenario "when i visit '/'" do
    visit root_path
    fill_in :zipcode, with: "80202"
    click_on "search"
    expect(current_path).to eq '/search'
    expect(page).to have_content("2 Total Stores")
  end
end





# And I should see a message that says "16 Total Stores"
# And I should see exactly 10 results
# And I should see the long name, city, distance, phone number and store type for each of the 10 results
