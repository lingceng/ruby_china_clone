class User < ActiveRecord::Base
  has_many :topics
  has_many :replies

  validates :name, :email, presence: true 
  
 
  def self.authenticate(name, password) 
    if user = self.find_by(name: name)
      if user.hashed_password == encrypt_password(password, user.salt)
        user
      end
    end
  end

  def self.encrypt_password(password, salt)
    Digest::SHA256.hexdigest(password + 'lingceng' + salt);
  end

  def password=(password)
    @password = password

    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, self.salt)
    end
  end

  private
    def generate_salt
      self.salt = self.object_id.to_s + rand.to_s
    end


end
