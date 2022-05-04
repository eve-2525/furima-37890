class Item < ApplicationRecord

  has_one_attached :image
  belongs_to:user

  validates :product, presence: true
  validates :product_description, presence: true
  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :postage_id, numericality: { other_than: 1 } 
  validates :area_id, numericality: { other_than: 1 } 
  validates :number_of_days_id, numericality: { other_than: 1 } 
  validates :price, presence: true

  validates :genre_id, numericality: { other_than: 1 } 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :area
  belongs_to :number_of_days

end
