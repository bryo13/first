class Assignment < ApplicationRecord
	mount_uploader :attachment ,AttachmentUploader
end
