class RecordAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/ }
    validates :token
  end

  def save
    record = Record.create(user_id:, item_id:)
    Address.create(postal_code:, prefecture_id:, city:, address:, building:, phone_number:, record_id: record.id)
  end
end