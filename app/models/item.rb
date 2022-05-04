class Item < ApplicationRecord

  has_one_attached :image
  belongs_to:user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :area
  belongs_to :number_of_days


end
