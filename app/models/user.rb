class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password

  has_many :visits
  has_many :countries, :through => :visits

  def full_name
    "#{first_name} #{last_name}"
  end

  def has_visited?(country)
    self.visits.where(country_id: country).count != 0
  end

  def visited_country_codes
    self.countries.map do |country|
      country.code.downcase
    end
  end

end
