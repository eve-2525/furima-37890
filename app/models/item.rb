class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :purchase_record

  validates :image, presence: true
  validates :product, presence: true
  validates :product_description, presence: true
  validates :category_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :condition_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :postage_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :area_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :number_of_days_id, numericality: { other_than: 1, message: "を入力してください" }

  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :area
  belongs_to :number_of_days
end
