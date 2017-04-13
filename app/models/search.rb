class Search < ApplicationController
  attr_reader :name, :city, :distance, :phone, :store_type

  def initialize(params)
    @name = params["name"]
    @store_type = params["store_type"]
  end

  def self.result(zipcode)
    stores = BestbuyService.all(zipcode)
    stores.map do |store|
      Search.new(store)
    end
  end
end
