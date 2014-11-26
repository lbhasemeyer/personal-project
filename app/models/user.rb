class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password

  def full_name
    "#{first_name} #{last_name}"
  end

end
