class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def page
    #if logged_in
      render json: { user: UserSerializer.new(current_user)}, status: :accepted
    #else
    #  render json: { error: 'user not logged in'}, status: :not_acceptable
    #end
  end

  def index
  end

def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user_id)
      render json: { user: UserSerializer.new(@user), jwt: @token}, status: :created
    else
      render json: { error: 'failed to create user'}, status: :not_acceptable
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
