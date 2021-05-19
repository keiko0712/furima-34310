require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
   describe "ユーザー新規登録" do
     it "passwordが空だと登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it "passwordが6文字以上でないと登録できない" do
      @user.password = 'aaaa1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end
     it "passwordとpassword_confirmationの値が一致しないと登録できない" do
      @user.password = 'aaaaaa1'
      @user.password_confirmation = 'aaaaaa2'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it "emailが一意性でないと登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      @user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
     end
     it "emailに＠を含まないと登録できない" do
      @user.email = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
     end
   end
 end