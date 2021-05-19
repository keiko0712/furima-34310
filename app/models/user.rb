class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   with_options presence: true, format: { with:  /\A[ぁ-んァ-ン一-龥]/} do
    validates :family_name, :first_name
   end

   with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :family_name_ruby, :first_name_ruby
    end

    with_options presence: true do
    validates :nickname, :birthday
      end

      validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

end
