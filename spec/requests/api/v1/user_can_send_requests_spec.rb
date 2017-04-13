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

  it "can send request for 1 item" do
    item = Item.create(name: "goat", description: "its a goat", image_url: "www.yahoo.com/goat")
    Item.create(name: "cow", description: "its a cow", image_url: "www.yahoo.com/cow")

    get "/api/v1/items/#{item.id}"

    expect(response).to be_success

    items = JSON(response.body)
    expect(items["name"]).to eq("goat")
    expect(items["description"]).to eq("its a goat")
    expect(items["image_url"]).to eq("www.yahoo.com/goat")
    expect(items["name"]).to_not eq("cow")
  end
end
