class Visit < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
  has_many :blogs
end
