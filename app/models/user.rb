require "bcrypt"
class User < ActiveRecord::Base

 has_attached_file(:avatar,
                  :default_url => ActionController::Base.helpers.asset_path("default.jpg"),
                  :styles => {:normal => "100x100>"})
 validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def password
        @password
  end

  def password=(new_password)
      @password = new_password
      self.password_digest = BCrypt::Password.create(new_password)
  end

  def authenticate(test_password)
    if BCrypt::Password.new(self.password_digest) == test_password
        self
    else
        false
    end
  end

end
