class Transaction < ApplicationRecord
  validates :name, presence: true 
end
