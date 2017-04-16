class Search

  attr_reader :name, :city, :distance, :phone, :store_type, :total

  def initialize(params)
    @name = params["longName"]
    @city = params["city"]
    @distance = params["distance"]
    @phone = params["phone"]
    @store_type = params["storeType"]
  end

  def self.result(zipcode)
    stores = BestbuyService.all(zipcode)["stores"]
    stores.map do |store|
      Search.new(store)
    end
  end

  def self.total(zipcode)
    BestbuyService.all(zipcode)["total"]
  end
end
