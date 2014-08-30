class User < ActiveRecord::Base
  
  attr_reader :password
  
  validates :username, :password, :session_token, presence: true
  validates :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  
  after_initialize :ensure_session_token
  
  has_many(
    :posts,
    class_name: "Post",
    foreign_key: :author_id,
    primary_key: :id
  )
  
  has_many(
    :subs,
    class_name: "Sub",
    foreign_key: :author_id,
    primary_key: :id
  )
  
  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return nil if user.nil?   
    digest = BCrypt::Password.new(user.password_digest)
    return user if digest.is_password?(password)
    nil
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  private
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
end
