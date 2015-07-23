class ProductsController < ApplicationController

	def index
		@user = User.find(params[:user_id])
		@products = @user.products.all.order(:deadline)
		@bid = Bid.new
	end

	def new
		@product = current_user.products.new
	end

	def create
		@product = current_user.products.new product_params
		if @product.save
			redirect_to user_products_path(current_user), notice: 'Great!! Your new product has been submited' 
		else
			render :new
		end
	end

	def edit
		@product = current_user.products.find(params[:id])
	end

	def update
		@product = current_user.products.find(params[:id])
		if @product.update_attributes(product_params)
			redirect_to user_products_path(current_user), notice: 'Great!! Your product has been edited' 
		else
			render :edit
		end
	end

	def show
		@user = User.find session[:user_id]
	end

	def destroy
    	@product = Product.find_by(id: params[:id]).try(:destroy)
    	redirect_to user_products_path(current_user), notice: "Product #{@product.inspect} has been removed."
  	end

	private

	def product_params
		params.require(:product).permit(:title, :description, :deadline, :logo)
	end
end

