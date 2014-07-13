class User < ActiveRecord::Base
  has_secure_password

  def admin?
    self.role.to_s == "admin"
  end

end