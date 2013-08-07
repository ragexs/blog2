class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  has_secure_password
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  before_save :create_remember_token
  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
