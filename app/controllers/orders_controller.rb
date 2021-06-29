class OrdersController < ApplicationController
  before_action :sold_out_item, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)   
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  
  private

 def order_params
  params.require(:order).permit(:item_id, :user_id, :postal_code, :building_name, :price, :number, 
    :exp_month, :exp_year, :cvc, :shipping_area_id, :municipality, :address, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id] ,token: params[:token])
 end

 def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
  Payjp::Charge.create(
    amount: @item[:price], 
    card: order_params[:token],    
    currency: 'jpy'                 
  )
end

def sold_out_item
  @item = Item.find(params[:item_id])
  if @item.purchase_record.present?
   redirect_to root_path 
  end
 end
end
