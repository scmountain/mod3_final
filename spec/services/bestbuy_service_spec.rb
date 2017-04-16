require "rails_helper"

describe BestbuyService do

  before(:each) do
    @service = BestbuyService.all(80202)
  end

  it "returns nearest stores" do
    stores = @service["stores"]
    store = stores.first
    expect(stores.count).to eq(10)
    expect(store["longName"]).to eq("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
  end
end
