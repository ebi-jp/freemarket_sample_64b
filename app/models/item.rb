class Item < ApplicationRecord
  # belongs_to :seller, class_name: "User"
  # belongs_to :buyer, class_name: "User"
  # # belongs_to :brand
  # belongs_to :category
  has_many :images, dependent: :destroy
  # mount_uploader :image, ImageUploader
  accepts_nested_attributes_for :images
end
