class SearchController < ApplicationController
  def show
    @stores = Search.result(params["zipcode"])
    @store_count = Search.total(params["zipcode"])
  end
end
