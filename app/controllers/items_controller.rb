class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect, only: [:edit, :update, :destroy]

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
   @item.destroy
    redirect_to root_path
  end


  private

  def find_item
    @item = Item.find(params[:id])
  end
  
  def redirect
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def item_params
    params.require(:item).permit(:image, :name, :description_of_item, :category_id, :item_status_id, :delivery_charge_id, :shipping_area_id, :estimated_shipping_date_id, :price
    ).merge(user_id: current_user.id)
  end
end
