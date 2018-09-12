class User < ApplicationRecord
  attr_reader :password

  ensure_session_token

  has_secure_token :session

  validates :username, :session_token, presence: true

  validates :password_digest, presence: true,
  message: "Password, can't be blank"

  validates :password, length: {minimum: 8, allow_nil: true}

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.find_by_credentials
    
  end
end
