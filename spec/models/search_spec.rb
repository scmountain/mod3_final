
require "rails_helper"

describe Search do
  it '#result' do
    stores = Search.result(80202)

    expect(stores.first.city).to eq("DENVER")
    expect(stores.first.distance).to eq(3.45)
    expect(stores.first.name).to eq("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
    expect(stores.first.phone).to eq("303-270-9189")
    expect(stores.first.store_type).to eq("Mobile SAS")
    expect(stores.count).to eq(10)
  end

  it '#total' do
    count = Search.total(80202)
    expect(count).to eq(16)
  end
end
