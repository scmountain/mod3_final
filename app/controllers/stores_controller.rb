class StoresController < ApplicationController
  def index
    Store.search(params[:zipcode])
  end
end
