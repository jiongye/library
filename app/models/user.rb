class User < ActiveRecord::Base
  belongs_to :role

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable,
  devise :database_authenticatable, :registerable, :validatable,
         :recoverable, :rememberable, :trackable

  validates_presence_of :role, :name, :username
  validates_uniqueness_of :username, :library_id
  validates_presence_of :password
  validates_confirmation_of :password
  validates_length_of :password, :within => 6..128, :allow_blank => true

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
