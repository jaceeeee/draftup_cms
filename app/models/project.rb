# join table between Student and Thesis
class Project < ApplicationRecord

  belongs_to :student
  belongs_to :thesis  
end
