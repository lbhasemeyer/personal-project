class Visit < ActiveRecord::Base

  belongs_to :user
  belongs_to :country
  has_many :blogs, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :photos, :dependent => :destroy

end
