class Visit < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
  has_many :blogs
  has_many :comments
  has_many :photos
end
