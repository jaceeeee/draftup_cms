class Collaboration < ApplicationRecord
  has_many :students, :class_name => 'Collaboration'
  has_one :collaboratedthesis
end
