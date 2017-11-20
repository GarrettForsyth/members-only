class User < ApplicationRecord

  has_many :posts

  has_secure_password
  before_create :remember

  attr_accessor :remember_token

  def remember
    self.remember_token = User.new_token
    self.remember_digest = User.digest(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

end
