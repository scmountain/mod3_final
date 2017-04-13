require 'rails_helper'

describe 'as a user I' do
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

  it "can delete 1 item" do
    item = Item.create(name: "goat", description: "its a goat", image_url: "www.yahoo.com/goat")
    Item.create(name: "cow", description: "its a cow", image_url: "www.yahoo.com/cow")

    delete "/api/v1/items/#{item.id}"


    expect(Item.count).to_not eq(2)
    expect(Item.count).to_not eq(8)
    expect(Item.first["name"]).to_not eq("goat")
    expect(Item.first["description"]).to_not eq("its a goat")
    expect(Item.first["image_url"]).to_not eq("www.yahoo.com/goat")
  end

  it "can send create request for 1 item" do

    post "/api/v1/items/new?name=goat&description=its20%a20%goat&image_url="

    expect(response).to be_success

    item = JSON(response.body)
    expect(item["name"]).to eq("goat")
    expect(item["description"]).to eq("its a goat")
    expect(item["image_url"]).to eq("www.yahoo.com/goat")
    expect(item["name"]).to_not eq("cow")
  end
end
