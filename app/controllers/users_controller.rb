class UsersController < ApplicationController
  respond_to :json, :html
  include ApplicationHelper
  def new 
    @user = User.new(user_params)
  end 

  def index
    @users = User.all
    respond_with @users, each_serializer: UserSerializer
  end


  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_session_path
    else 
      render :new 
    end
  end



  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :internal_server_error
    end
  end

  def show 
    @user = User.find(params[:id])
  end 

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      render json: @user, status: :accepted
    else
      render json: @user.errors, status: :internal_server_error
    end
  end

  def edit 
    @user = User.find(params[:id])
  end 

  private

  def user_params
    params.fetch(:user,{}).permit(:name, :email, :age, :location, :avatar, :password)
  end

  
end
