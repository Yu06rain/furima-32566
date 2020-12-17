class Residence < ApplicationRecord
  belongs_to :purchase_history, optional: true
end
