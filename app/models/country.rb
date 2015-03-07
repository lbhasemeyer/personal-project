class Country < ActiveRecord::Base

  has_many :visits
  has_many :blogs, through: :visits
  has_many :comments, through: :visits
  has_many :photos, through: :visits

end
