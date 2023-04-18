class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :item_name,   presence: true
  validates :concept,     presence: true
  validates :material,    presence: true
  validates :category_id, presence: true
  validates :price,       presence: true
  validates :category_id, numericality: { other_than: 1 , message: "を選択してください"}
end
