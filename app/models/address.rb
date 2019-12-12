class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user_id
  belongs_to_active_hash :prefecture
end
