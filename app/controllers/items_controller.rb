class ItemsController < ApplicationController
  # def index
  # end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    @item.images.build(item_params[:imeges_attributes])
    # @item = current_user.items.build(item_params)
    @item.send_plan = "ヤマト"
    @item.seller_id = 1
    @item.brand_id = "1"
    # @item = current_user.items.build(item_params)
    
    if @item.save

    else
      render :new
    end
  end
  
  def show
    # @item = Items.find(params[:id])
    # @user = Users.find(params[:id])
  end
  
  
  private
  def item_params
    params.require(:item).permit(
                            :item,
                            :price,
                            :size,
                            :status,
                            :send_burden,
                            :send_plan,
                            :delivery_source,
                            :send_day,
                            :description,
                            :seller_id,
                            :buyer_id,
                            :category_id,
                            :brand_id, 
                            images_attributes: [:id, :image]
                            )
  end

end
