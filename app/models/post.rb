class Post < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  has_many :comments
  belongs_to :user
end
