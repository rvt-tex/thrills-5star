class UsersController < ApplicationController

    def index
        users = User.all 
        render json: users
    end 

    def show 
        @user = User.find_by_id(params[:id])
        render json: @user
    end 
    
    def create 
        user = User.new(user_params)
        if user.save 
            render json: user
            # render json: UserSerializer.new(user)
        else 
            render json: {errors: user.errors.full_messages}, status: :unprocessible_entity
        end 
    end 

    def destroy 
        user = User.find_by_id(params[:id])
        if user.destroy
            users = User.all 
            render json: users
            # render json: UserSerializer.new(users)
        else
            render json: { message: "error"}  
        end 
    end 

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :phone, :password)
    end 

    def find_user
        @user = User.find_by_id(params[:id])
    end
end
