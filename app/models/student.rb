class Student < ApplicationRecord

  # student.authenticate, student.save, student.errors, student.password_digest
  has_secure_password
  scope :sorted, lambda { order("first_name ASC") }

  has_many :projects
  has_many :theses, :through => :projects
  belongs_to :collaboration, { :optional => true }

  mount_uploader :profile_pic, ProfilePictureUploader # Tells rails to use this uploader for this model.
  validates :last_name, presence: true # Make sure the owner's name is present.

end

