class ItemsController < ApplicationController
  before_action :set_item, only:[:show, :edit, :update]
  # def index
  # end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
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

  def edit
    # @items = Image.find(params[:id])
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
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
