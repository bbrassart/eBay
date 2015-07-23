class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @product = Product.find(params[:product])
    render :new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new review_params
    @review.user_id = current_user.id
    if @review.valid? && @product.present?
      @review.save
      @product.reviews << @review
      redirect_to user_products_path(@product.user_id), notice: "The review has been posted."
    else 
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
