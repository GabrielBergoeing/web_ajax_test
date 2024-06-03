class UsersController < ApplicationController
    def index
      @users = User.all
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        respond_to do |format|
          format.html { redirect_to users_path }
          format.js
        end
      else
        respond_to do |format|
          format.html { render :index }
          format.js { render :error }
        end
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end
  end
  