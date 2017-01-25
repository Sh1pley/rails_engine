class Merchant < ApplicationRecord
  validates :name, presence: true
  has_many :invoices
  has_many :items, through: :invoices
end
