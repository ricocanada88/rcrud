class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def show
        @users = User.find(params[:id])
    end

    def new
        @users = User.new
    end

    def create
        @users = User.new(user_params)
        if @users.save
          redirect_to @users
        else
          render 'index'
        end
    end
    
    def edit
        @users = User.find(params[:id])
    end

    def update
        @users = User.find(params[:id])
    
        if @users.update(user_params)
          redirect_to @users
        else
          render :edit, status: :unprocessable_entity
        end
      end

    def destroy
        @users = User.find(params[:id])
        @users.destroy
        redirect_to root_path
    end

    private
        def user_params
            params.required(:user).permit(:name, :description)
        end
    
    
end