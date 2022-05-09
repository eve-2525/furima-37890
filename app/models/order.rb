class Order
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:postal_code,:area_id,:city,:block_number,:building,:telephone_number,:purchase_record


  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :area_id, presence: true
  validates :city, presence: true
  validates :block_number, presence: true
  # validates :purchase_record_id, presence: true



  with_options presence: true,
  format: { with: /[0-9]{3}-[0-9]{4}/, message: 'is invalid. Input full-width characters' } do
validates :postal_code
end

  with_options presence: true,
               format: { with: /0\d{9,10}/, message: 'is invalid. Input full-width characters' } do
    validates :telephone_number
  end

def save

    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)

    ShippingAddress.create(postal_code: postal_code, area_id: area_id, city: city, block_number: block_number, building: building, telephone_number: telephone_number ,purchase_record_id: purchase_record.id)
  end
end