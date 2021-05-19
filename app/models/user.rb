class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :nickname, :birthday
            with_options format: { with: /\A[ぁ-んァ-ン一-龥]/} do
            validates :first_name, :family_name
            end
            with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
            validates :family_name_ruby, :first_name_ruby
            end
            with_options format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i } do
            validates :password
        end
      end
    end

  