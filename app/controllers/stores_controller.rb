class StoresController < ApplicationController
  def index
      @stores = Store.all
  end

  def new
    @store = Store.new
  end
end
