class User < ActiveRecord::Base
  belongs_to :role

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  validates_presence_of :role, :name, :username
  validates_uniqueness_of :username, :library_id
  validates_presence_of :password, :if => :password_required?
  validates_confirmation_of :password, :if => :password_required?
  validates_length_of :password, :within => 6..128, :allow_blank => true
  validates_uniqueness_of :email, :allow_blank => true, :case_sensitive => false
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :allow_blank => true

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :username, :role_id

  before_validation :generate_library_id, :on => :create

  def role?(role_name)
    role.name == role_name.to_s
  end

  private

  def password_required?
    !password.blank? || !password_confirmation.blank?
  end

  def generate_library_id
    last_id = User.count
    self.library_id = ('0' * (5 - last_id.to_s.length)).to_s << (last_id + 1).to_s
  end

end
