class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :region
  belongs_to_active_hash :shipping

  belongs_to :user
  has_one    :purchase
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :price, numericality: { only_integer: true, message: 'Half-width number.' }

  with_options numericality: { other_than: 0, message: 'SELECT' } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :region_id
    validates :shipping_data_id
  end
end
