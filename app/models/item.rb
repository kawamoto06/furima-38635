class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :shipping_date
  belongs_to :prefecture


  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :shipping_date_id, presence: true
  validates :image, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
            format: { with: /\A[0-9]+\z/ },presence: { message: "can't be blank" }

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :prefecture_id
    validates :shipping_cost_id
    validates :shipping_date_id
  end
end