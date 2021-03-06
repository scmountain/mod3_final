class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params["id"])
  end

  def destroy
    Item.find(params["id"]).destroy
    head :no_content
  end

  def new
    item = Item.create(strong_params)
    if item.save
      render json: Item.last
    end
  end

  private
  def strong_params
    params.permit(:name, :description, :image_url)
  end

end
