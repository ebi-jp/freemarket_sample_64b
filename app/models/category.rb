class Category < ApplicationRecord
  has_many :items
  belongs_to :parent, class_name: "Categories", foreign_key: :"parent_id"
  has_many :children, class_name: "Categories", foreign_key: :"parent_id"
end
