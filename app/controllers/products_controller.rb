class ProductsController < ApplicationController

  def index
    @products = Product.all 
    render :index
  end

  def create
    @photo = Photo.create(
      name: params[:name],
      category: params[:category],
      price: params[:price],
      website_url: params[:website_url],
      image_url: params[:image_url]
    )
    render :show
  end

end
