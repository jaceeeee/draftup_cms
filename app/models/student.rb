class Student < ApplicationRecord

  scope :sorted, lambda { order("first_name ASC") }
end
