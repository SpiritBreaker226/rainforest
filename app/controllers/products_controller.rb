class ProductsController < ApplicationController
  before_filter :ensure_logged_in, only: [:new, :create, :destroy]

  def index
    @products = if params[:search]
      # needs to lower both the coloum value and the item form the user as
      # different case will not be find even tho they have the same text
      Product.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
    else
      Product.all
    end
  end

  def create
  	@product = Product.new(product_params)

  	@product.save ? redirect_to(products_url) : render(:new)
  end

  def new
  	@product = Product.new
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def show
  	@product = Product.find(params[:id])

    @review = @product.reviews.build if current_user
  end

  def update
  	@product = Product.find(params[:id])

  	@product.update_attributes(product_params) ? redirect_to(product_path(@product)) : render(:edit)
  end

  def destroy
  	@product = Product.find(params[:id])
  	@product.destroy
  	redirect_to(products_path)
  end

  private

  def product_params()
  	params.require(:product).permit(:name, :description, :price_in_cents)
  end
end
