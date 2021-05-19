require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
   describe "ユーザー新規登録" do
    context "ユーザー新規登録ができない時" do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
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
     it "passwordが半角英数字混合でないと登録できない" do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
     end
    end
    context "ユーザー新規登録ができる時" do
     it "passwordは確認用を含めて2回入力すること" do
      @user.password = 'aaaaaa1'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "passwordとpassword_confirmationの値が一致しないと登録できない" do
      @user.password = 'aaaaaa1'
      @user.password_confirmation = 'aaaaaa2'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "ユーザー本名は、名前が必須であること" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
     end 
     it "ユーザー本名は、名字が必須であること" do
      @user.family_name = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
     end 
     it "ユーザー本名の名字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.family_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
     end
     it "ユーザー本名の名前、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
     end
     it "ユーザー本名の名字はフリガナが必須であること" do
      @user.family_name_ruby = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name ruby can't be blank")
     end
     it "ユーザー本名の名前はフリガナが必須であること" do
      @user.first_name_ruby = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name ruby can't be blank")
     end
     it "ユーザー本名の名字のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.family_name_ruby = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name ruby is invalid")
     end
     it "ユーザー本名の名前のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.first_name_ruby = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name ruby is invalid")
     end
     it "birthdayが空だと登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
    end
   end
 end