class Thesis < ApplicationRecord
  # tells Rails to use this uploader for this model.
  mount_uploader :attachment, AttachmentUploader
  # make sure the thesis' name is present
  validates :title, presence: true

  has_many :projects
  has_many :students, :through => :projects
end
