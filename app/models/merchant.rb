class Merchant < ActiveRecord::Base
  attr_accessor :password

  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :name, :name_on_coupon
  validates_presence_of :email
  validates_uniqueness_of :email


  def encrypt_password
    if password.present?
      self.password_salt= BCrypt::Engine.generate_salt
      self.password_hash= BCrypt::Engine.hash_secret(password, self.password_salt)
    end
  end

  def self.authenticate(email, password)
    merchant = Merchant.find_by_email(email)
    if merchant && merchant.password_hash == BCrypt::Engine.hash_secret(password, merchant.password_salt)
      merchant
    end
  end

end
