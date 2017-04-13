class SearchController < ApplicationController
  def show
    @stores = Search.result(params["zipcode"])
  end
end
