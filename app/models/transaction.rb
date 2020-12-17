class Transaction
  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id, :price, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :region_id, numericality: { other_than: 0, message: 'Select' }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A0[789]0\d{8}\z/, message: 'Input only number' }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Residence.create(postal_code: postal_code, region_id: region_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
