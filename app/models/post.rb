class Post < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_many :likes

  validates :Description, presence:true
  has_one_attached :post_feed

end
