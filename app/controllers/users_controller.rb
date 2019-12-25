class UsersController < ApplicationController


  def index
    @items = Item.limit(10).order('id DESC')
    # @user = User.find_by(id: @item.seller_id)
    
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



end
