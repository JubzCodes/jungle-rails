class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, presence: true
  validates_uniqueness_of :email, case_sensitive: false, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 5 }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email)
    user && user.authenticate(password) 
  end

end 