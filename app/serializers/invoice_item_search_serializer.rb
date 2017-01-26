class SearchSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :unit_price, :item_id, :created_at,:updated_at

  def unit_price
    byebug
    (object.unit_price * 100).to_i
  end
end
