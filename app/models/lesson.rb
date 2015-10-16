class Lesson < ActiveRecord::Base
	belongs_to :sections
	mount_uploader :video, VideoUploader
end
