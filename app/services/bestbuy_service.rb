class BestbuyService
  def self.all(zipcode)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zipcode},25))?format=json&show=storeId,storeType,name&pageSize=2&apiKey=7a3heu7emrjz6qbsugmepbv6")
    data = JSON.parse(response.body)
    data["stores"]
  end
end
