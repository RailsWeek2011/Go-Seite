class User < ActiveRecord::Base
  ROLES = %w[admin fModerator blModerator tModerator author guest]

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :Name, :email, :password, :password_confirmation, :remember_me, :roles
  #mount_uploader :avatar, AvatarUploader

  def role? (role)
    roles.include?(role.to_s)
  end

  def roles= (roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end
end
