require 'rails_helper'

feature "as a user" do
  scenario "when i visit '/'" do
    visit root_path
    fill_in :zipcode, with: "80202"
    click_on "search"
    expect(current_path).to eq '/search'

    expect(page).to have_content("16 Total Stores")
    expect(page).to have_content("DENVER")
    expect(page).to have_content(3.45)
    expect(page).to have_content("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
    expect(page).to have_content("303-270-9189")
    expect(page).to have_content("Mobile SAS")
    expect(page).to have_css('.store_card', count: 10)
  end
end





# And I should see exactly 10 results
