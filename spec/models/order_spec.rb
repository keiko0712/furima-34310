require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item,user_id:@user.id)
  end
  describe "商品購入" do
    context '商品購入ができる時' do
      it '全ての値が正しく入力されていれば購入できる' do
      expect(@order).to be_valid
      end
   end
   context '商品購入ができない時' do
   it "postal_codeが空だと購入できない" do
     @order.postal_code = nil
     @order.valid?
     expect(@order.errors.full_messages).to include("Postal code can't be blank")
   end
   it "shipping_area_idが空だと購入できない" do
     @order.shipping_area_id = nil
     @order.valid?
     expect(@order.errors.full_messages).to include("Shipping area can't be blank")
   end
   it "municipalityが空だと購入できない" do
     @order.municipality = nil
     @order.valid?
     expect(@order.errors.full_messages).to include("Municipality can't be blank")
   end
   it "addressが空だと購入できない" do
     @order.address = nil
     @order.valid?
     expect(@order.errors.full_messages).to include("Address can't be blank")
   end
   it "phone_numberが空だと購入できない" do
     @order.phone_number = nil
     @order.valid?
     expect(@order.errors.full_messages).to include("Phone number can't be blank")
   end
   it "phone_numberは12桁以上だと購入できない" do
    @order.phone_number = 123456789012
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone number is invalid")
  end
   it "postal_codeにハイフンがないと購入できない" do
    @order.postal_code = 1234567
    @order.valid?
    expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
  end
  end
 end
end 