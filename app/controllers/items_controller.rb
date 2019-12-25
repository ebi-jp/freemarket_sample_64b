class ItemsController < ApplicationController
  before_action :set_item, only:[:show, :edit, :update]

  def new
    unless user_signed_in?
      redirect_to new_user_path
    end
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
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
    @user = User.find_by(id: @item.seller_id)
    @brand = Brand.find_by(id: @item.brand_id)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy if @item.seller_id === current_user.id
    redirect_to root_path
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
                            :parent_id,
                            :brand_id, 
                            images_attributes: [:id, :image]
                            ).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
