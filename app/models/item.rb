class Item < ApplicationRecord

  has_one_attached :image
  belongs_to:user

  validates :product, presence: true
  validates :product_description, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :number_of_days_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true
  validates :image, presence: true

  with_options presence: true,
  format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' } do
validates :price
end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :area
  belongs_to :number_of_days

end
