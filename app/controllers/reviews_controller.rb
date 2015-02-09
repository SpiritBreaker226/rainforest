class ReviewsController < ApplicationController
	before_filter :ensure_logged_in, only: [:new, :create, :destroy]
  before_filter :load_product

  def show
  	@review = Review.find(params[:id])
  end

  def create
    
  	@review = @product.reviews.build(review_params)
  	@review.user = current_user

  	# Check out this article on [.build](http://stackoverflow.com/questions/783584/ruby-on-rails-how-do-i-use-the-active-record-build-method-in-a-belongs-to-rel)
    # You could use a longer alternate syntax if it makes more sense to you
    # 
    # @review = Review.new(
    #   comment: params[:review][:comment],
    #   product_id: @product.id,
    #   user_id: current_user.id
    # )
    
    @review.save ? redirect_to(products_path, notice: "Review created successfully") : render("proudcts/show")
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    @review.update(review_params) ? redirect_to({ controller: "products", action: "show" , id: @product.id }, notice: "Review updated successfully") : render(:edit)          
  end

  def destroy
  	@review = Review.find(params[:id])
  	reviews.destroy
  end

  private

  def review_params
  	params.require(:review).permit(:comment, :product_id)
  end

  def load_product
  	@product = Product.find(params[:product_id])
  end
end
