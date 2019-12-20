class Item < ApplicationRecord
  # belongs_to :seller, class_name: "User"
  # belongs_to :buyer, class_name: "User"
  # # belongs_to :brand
  # belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :parent
  belongs_to_active_hash :condition
  belongs_to_active_hash :hutan
  belongs_to_active_hash :days
  belongs_to_active_hash :prefecture
  delegate :category, to: :parent
  delegate :status, to: :condition
  delegate :burden, to: :hutan
  delegate :period, to: :days
  delegate :name, to: :prefecture

  # def previous
  #   Item.where(“id < ?”, self.id).order(“id DESC”).first
  # end

  # def next
  #   Item.where(“id > ?”, self.id).order(“id ASC”).first
  # end
end
