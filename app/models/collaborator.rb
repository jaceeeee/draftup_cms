class Collaborator < ApplicationRecord
  has_many :students, :class_name => "Collaborator"
  belongs_to :collaborated_thesis
  belongs_to :collaboration
end
