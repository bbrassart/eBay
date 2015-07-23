class UsersController < ApplicationController
    def index
      @users = User.all
    end

    def show
		@user = User.find(params[:id])
	end

	def destroy
      current_user.try(:destroy)
    	redirect_to users_path, notice: "The user named #{current_user.name} has been destroyed."
  	end

	def edit
		@user = current_user
	end

	def new
    	@user = User.new
  end

	def create
		@user = User.new(user_params)
		if User.find_by(name: params[:user][:name])
			redirect_to new_user_path, notice: 'The user already exists. Please create a new one...'	
		elsif @user.valid?
			@user.save
      session[:user_id] = @user.id
			redirect_to users_path, notice: 'The user was successfully created.'
		else
			render :new
		end
	end

	def update
		if current_user.update_attributes(user_params)
			redirect_to users_path, notice: 'User was successfully updated.'
		else
			render :edit
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :logo, :password, :password_confirmation)
	end

end
