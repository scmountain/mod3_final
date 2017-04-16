class BestbuyService
  def self.all(zipcode)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zipcode},25))?format=json&show=longName,city,distance,phone,storeType&apiKey=#{ENV['secret_key']}")
    data = JSON.parse(response.body)
    data
  end
end
