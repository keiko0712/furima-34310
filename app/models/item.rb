class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :delivery_charge, :estimated_shipping_date, :item_status, :shipping_area

  validates :image, :name, :description_of_item, presence: true

  validates :category_id, numericality: { other_than: 1 } 
  validates :delivery_charge_id, numericality: { other_than: 1 } 
  validates :estimated_shipping_date_id, numericality: { other_than: 1 } 
  validates :item_status_id, numericality: { other_than: 1 } 
  validates :shipping_area_id, numericality: { other_than: 1 } 

  VALID_PRICEL_HALF =                 /\A[0-9]+\z/
  validates  :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

end
