class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    @item.images.build(item_params[:imeges_attributes])
    # @item = current_user.items.build(item_params)
    @item.id = "1"
    @item.size = "1"
    @item.status = "新品"
    @item.send_burden = "送料込み"
    @item.send_plan = "ヤマト"
    @item.send_day = "1~2日"
    @item.seller_id = "5"
    @item.buyer_id = "6"
    @item.category_id = "7"
    @item.brand_id = "8"
    @item.created_at = "2019-12-20"
    @item.updated_at = "2019-12-21"
    # @item = current_user.items.build(item_params)
    binding.pry
    if @item.save

    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(
                            :name,
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
