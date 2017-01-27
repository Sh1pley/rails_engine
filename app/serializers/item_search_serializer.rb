class ItemSearchSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :unit_price, :created_at, :updated_at, :merchant_id

  def unit_price
    (object.unit_price * 100).to_i
  end
end
