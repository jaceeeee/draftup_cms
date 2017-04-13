class Thesis < ApplicationRecord
    mount_uploader :attachment, AttachmentUploader # tells Rails to use this uploader for this model.
    validates :title, presence: true # make sure the owner's name is present
end
