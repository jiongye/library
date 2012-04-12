class User < ActiveRecord::Base
  belongs_to :role
  has_one :contact, :dependent => :destroy

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  #validates_presence_of :email
  validates_uniqueness_of :email, :allow_blank => true, :case_sensitive => false
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :allow_blank => true

  validates_presence_of :password, :if => :password_required?
  validates_confirmation_of :password, :if => :password_required?
  validates_length_of :password, :within => 6..128, :allow_blank => true

  validates_presence_of :role
  validates_uniqueness_of :username

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :username, :role_id, :contact_attributes
  # attr_accessible :title, :body


  before_validation :set_default_role

  accepts_nested_attributes_for :contact, :reject_if => :all_blank

  private

  def set_default_role
    borrower = Role.find_by_name("borrower")
    self.role = borrower unless role
  end

  def password_required?
    !persisted? || !password.blank? || !password_confirmation.blank?
  end
end
