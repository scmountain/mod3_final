class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params["id"])
  end

  def destroy
    Item.find(params["id"]).destroy
    redirect_to root_path
  end

  def new
    item = Item.new(strong_params)
    if item.save
      Item.create(strong_params)
      render json: Item.find(params["id"])
    end
  end

  private
  def strong_params
    params.permit(:name, :description, :image_url)
  end

end
