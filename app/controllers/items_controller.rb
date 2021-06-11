class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  

  def new
    @item = Item.new
  end

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :show
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:image, :name, :description_of_item, :category_id, :item_status_id, :delivery_charge_id, :shipping_area_id, :estimated_shipping_date_id, :price
    ).merge(user_id: current_user.id)
  end
end
