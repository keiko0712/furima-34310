class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_charge
  belongs_to :estimated_shipping_date
  belongs_to :item_status
  belongs_to :shipping_area
  belongs_to :user

  validates :image, :name, :description_of_item, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id, :delivery_charge_id, :estimated_shipping_date_id,
              :item_status_id, :shipping_area_id
  end

  VALID_PRICEL_HALF =                 /\A[0-9]+\z/
  validates  :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

end
