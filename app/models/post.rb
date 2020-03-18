class Post < ApplicationRecord
  belongs_to :user
  has_many :posttags
  has_many :tags, through: :posttags
end
