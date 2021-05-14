class Furima < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :day
  belongs_to :delivery_charge
  belongs_to :status
  belongs_to :user
  has_one    :purchase
  has_one_attached :image

  validates :image, :furima_name, :description, presence: true

  validates :area_id, :category_id, :day_id, :delivery_charge_id, :status_id, numericality: { other_than: 1 }, presence: true

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :price, presence: true
end
