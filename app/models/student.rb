class Student < ApplicationRecord

  # student.authenticate, student.save, student.errors, student.password_digest
  has_secure_password
  scope :sorted, lambda { order("first_name ASC") }
end
