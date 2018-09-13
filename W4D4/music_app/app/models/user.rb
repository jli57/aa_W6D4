# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  
  validates :email, :session_token, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}
  validates :email, :password_digest, :session_token, presence: true
  after_initialize :ensure_session_token
  
  attr_reader :password
  

  
  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end 
  
  def reset_session_token!
    self.session_token = generate_session_token
    self.save!
    self.session_token
  end 
  
  def generate_session_token
    token = SecureRandom.urlsafe_base64
    
    while User.exists?(session_token: token)
      token = SecureRandom.urlsafe_base64
    end 
    
    token
  end 
  
  def ensure_session_token
    self.session_token ||= generate_session_token
  end 
  
  def my_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end 
  
  def User.find_by_credentials(email, pw)
    @user = User.find_by(email: email)
    
    if @user.my_password?(pw)
      @user
    else
      nil
    end
    
    
    
  end 
end
