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

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:name] || @product.name,
      category: params[:category] || @product.category,
      price: params[:price] || @product.price,
      website_url: params[:website_url] || @product.website_url, 
      image_url: params[:image_url] || @product.image_url,
    )
    render :show
  end

end
