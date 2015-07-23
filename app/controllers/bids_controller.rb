
class BidsController < ApplicationController

	def new
		@bid = Bid.new
		@product = Product.find(params[:product])
		render :new
	end

	def create
		@product = Product.find(params[:product_id])
		@bid = @product.bids.new bid_params
		@bid.user_id = current_user.id
		if (@bid.amount < @product.price) 
			redirect_to user_products_path(@product.user_id), notice: "Somehting went wrong. Your bid has to be higher than the price set by the owner"
		elsif (@bid.valid? && @product.present?) 
			@bid.save
			@product.bids << @bid
			redirect_to user_products_path(@product.user_id), notice: "The bid #{@bid.amount}€ has been placed."
		else
			render :new
		end
	end

	private

	def bid_params
		params.require(:bid).permit(:amount)
	end
end
