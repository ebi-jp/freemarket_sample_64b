class ItemsController < ApplicationController
  before_action :set_item, only:[:show]
  # def index
  # end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    @item.images.build(item_params[:imeges_attributes])
    # @item = current_user.id
    @item.send_plan = "ヤマト"
    @item.brand_id = 1
    if @item.save
      render template: "items/after-sell"
    else
      render :new
    end
  end
  
  def show
    @item = Item.find(params[:id])
    
    # @user = Users.find(params[:id])
  end
  
  
  private
  def item_params
    params.require(:item).permit(
                            :item,
                            :price,
                            :size,
                            :condition_id,
                            :hutan_id,
                            :send_plan,
                            :prefecture_id,
                            :days_id,
                            :description,
                            :category_id,
                            :brand_id, 
                            images_attributes: [:id, :image]
                            ).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
