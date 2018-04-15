class Assignment < ApplicationRecord
	mount_uploader :attachment ,AttachmentUploader
	belongs_to :course
	belongs_to :user

	
	validates :course_code, presence: true
	validates :course_name, presence: true
	validates :attachment, presence: true
	validates :semister, presence: true
end
