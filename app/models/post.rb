class Post < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true
  
  has_many :favorites
  has_many :added_favorites, through: :favorites, source: :user
end
