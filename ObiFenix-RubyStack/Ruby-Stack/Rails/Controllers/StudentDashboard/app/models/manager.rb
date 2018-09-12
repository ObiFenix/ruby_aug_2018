class Manager < ActiveRecord::Base
  has_secure_password

  belongs_to :dojo
  has_many   :students_managed, through: :dojo, source: :dojo
  validates  :first_name, :last_name, :email, presence: true, length: { in: 2..25 }
  validates  :email, uniqueness: { case_sensitive: false }
  # has_many   :students_managed, through: :dojo

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  before_validation :downcase_fields

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, length: { minimum: 8, maximum: 15 }, on: :create
  # before_save { |user| user.email = user.email.downcase }
  private
    def downcase_fields
      self.email.downcase!
    end
end
