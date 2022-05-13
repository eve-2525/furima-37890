class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :city, :block_number, :building, :telephone_number, :purchase_record,
                :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'は半角数字、3桁-4桁の入力をしてください(123-4567)' }
    validates :user_id
    validates :item_id
    validates :area_id, numericality: { other_than: 1, message: "を入力してください" }
    validates :city
    validates :block_number
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: '半角数字を入力してください' }
  end

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)

    ShippingAddress.create(postal_code: postal_code, area_id: area_id, city: city, block_number: block_number,
                           building: building, telephone_number: telephone_number, purchase_record_id: purchase_record.id)
  end
end
