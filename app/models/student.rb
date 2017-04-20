class Student < ApplicationRecord

  # use the following methods to manipulate students using the Rails Console
  # student.authenticate, student.save, student.errors, student.password_digest

  # function to indicate password_digest
  has_secure_password

  # named scopes
  scope :sorted, lambda { order("last_name ASC") }

  has_many :projects
  has_many :theses, :through => :projects
  has_and_belongs_to_many :collaborations

  mount_uploader :profile_pic, ProfilePictureUploader # tells Rails to use this uploader for this model
  validates :last_name, presence: true # Make sure that the owner's last name is present.
end
