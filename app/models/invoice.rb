class Invoice < ApplicationRecord
  validates :customer_id, presence: true
  validates :merchant_id, presence: true
  validates :status, presence: true
end