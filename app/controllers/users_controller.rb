class UsersController < ApplicationController


  def index
    # binding.pry
    # @item = Item.find(params[:item_id])
    @items = Item.limit(10).order('id DESC')
    @items2 = Item.limit(1).order('id DESC')
  end

  def edit
    @user = User.find(params[:id])
  end

  def mypage
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def logout
    @user = User.find(params[:id])
  end

  # def edit
  #   @user = User.find(params[:id])
  # end

  # def mypage
  #   @user = User.find(params[:id])
  # end

end
