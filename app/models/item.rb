class Item < ApplicationRecord

  has_one_attached :image
  belongs_to:user

  validates :product, presence: true
  validates :product_description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :postage_id, presence: true
  validates :area_id, presence: true
  validates :number_of_days_id, presence: true
  validates :price, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :area
  belongs_to :number_of_days

end
