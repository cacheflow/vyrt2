require "bcrypt"
class User < ActiveRecord::Base
has_secure_password 
 has_attached_file(:avatar, 
                  :default_url => ActionController::Base.helpers.asset_path("default.jpg"),
                  :styles => {:normal => "100x100>"})  

 validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

    has_many :user_friendships
    has_many :friends, :through => :user_friendships
    has_many :inverse_user_friendships, :class_name => "UserFriendship", :foreign_key => "friend_id"
    has_many :inverse_friends, :through => :inverse_user_friendships, :source => :user

  def password
    @password 
   ##we create a reader method for password  
  end 

  def password=(new_password)
   ##we create a setter method for password
   @password = new_password
   self.password_digest = BCrypt::Password.create(new_password)
   ##calls password_digest on user and uses Bcrypt to hash the password.
  end

  def authenticate(temp_password) 
    if BCrypt::Password.new(self.password_digest) == temp_password 
      self 
    else  
      false 
    end 
  end 

end
