class User < ApplicationRecord
  has_secure_password

  def authenticate_with_credentials(email, password)
    @user = User.find_by_email(email.downcase.strip)
    if @user.authenticate(password)
      return @user
    else
      return nil
    end
  end

  validates :email, presence: true, :uniqueness => {:case_sensitive => false}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, confirmation: true, length: {minimum: 10}
  validates :password_confirmation, presence: true
end
