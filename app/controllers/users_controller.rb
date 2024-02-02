class UsersController < ApplicationController
    def create
        @user = User.new(name: params[:name], email: params[:email])
        if @user.save
            render json: @user
        else
            render json: {error: "Unable to create user."}
        end
    end

    def index
        @users = User.all
        render json: @users
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def update
        @user = User.find(params[:id])
        if @user.update(name: params[:name], email: params[:email])
            render json: @user
        else
            render json: {error: "Unable to update user."}
        end
    end

    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            render json: {message: "User successfully deleted."}
        else
            render json: {error: "Unable to delete user."}
        end
    end
end
