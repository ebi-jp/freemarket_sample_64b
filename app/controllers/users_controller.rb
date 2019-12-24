class UsersController < ApplicationController
  def index
    # binding.pry
    # @item = Item.find(params[:item_id])
    @items = Item.limit(10).order('id DESC')
    @items2 = Item.limit(1).order('id DESC')
  end

  def show
  end
end
