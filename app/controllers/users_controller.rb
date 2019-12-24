class UsersController < ApplicationController
  def index
  end

  def show
  end

  def logout
  end

  def edit
    @user  =User.find(params[:id])
  end

end
