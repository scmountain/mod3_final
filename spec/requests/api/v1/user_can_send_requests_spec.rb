require 'rails_helper'

describe 'as a user I can send' do
  it "can send request, see all items" do
    item = Item.create(name: "goat", description: "its a goat", image_url: "www.yahoo.com/goat")
    Item.create(name: "cow", description: "its a cow", image_url: "www.yahoo.com/cow")
    Item.create(name: "pig", description: "its a pig", image_url: "www.yahoo.com/pig")

    get "/api/v1/items"

    expect(response).to be_success

    items = JSON(response.body)
    expect(items.count).to eq(3)
    expect(items.first["name"]).to eq("goat")
    expect(items.last["name"]).to eq("pig")
    expect(items.last["name"]).to_not eq("chicken")
  end
end
