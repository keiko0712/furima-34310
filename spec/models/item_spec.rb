require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    # binding.pry
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item,user_id:@user.id)
  end
  describe "商品出品" do
    context '商品出品ができる時' do
      it '全ての値が正しく入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができない時' do
    it "imageが空だと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "nameが空では登録できない" do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "description_of_item が空では登録できない" do
      @item.description_of_item = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description of item can't be blank")
    end
    it "categoryが空では登録できない" do
      @item.category_id  = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it "item_statusが空では登録できない" do
      @item.item_status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Item status must be other than 1")
    end
    it "delivery_chargeが空では登録できない" do
      @item.delivery_charge_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
    end
    it "shipping_areaが空では登録できない" do
      @item.shipping_area_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
    end
    it "estimated_shipping_dateが空では登録できない" do
      @item.estimated_shipping_date_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Estimated shipping date is not a number")
    end
    it "priceが空では登録できない" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")      
    end
    it 'priceが全角数字だと出品できない' do
      @item.price = "２０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
 end
end 