class ProductsController < ApplicationController

  def index
    @products = Product.all 
    render :index
  end

  def create
    @product = Product.create(
      name: params[:product][:name],
      category: params[:product][:category],
      price: params[:product][:price],
      website_url: params[:product][:website_url],
      image_url: params[:product][:image_url]
    )
    redirect_to "/products"
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
  
  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: { message: "Product destroyed successfully" }
  end
end
