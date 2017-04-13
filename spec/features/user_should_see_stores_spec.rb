require 'rails_helper'

feature "as a user" do
  scenario "when i visit '/'" do
    visit root_path
    fill_in :zip, with: "80202"
  end
end




# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "16 Total Stores"
# And I should see exactly 10 results
# And I should see the long name, city, distance, phone number and store type for each of the 10 results
