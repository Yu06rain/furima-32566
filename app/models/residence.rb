class Residence < ApplicationRecord
  belongs_to :purchase_history, optional: true
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :region_id, numericality: { other_than: 0, message: 'Select' }
    validates :municipality
    validates :address
    validates :phone_number, numericality: { only_integer: true, message: 'Input only number' }
  end
end
