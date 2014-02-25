class Image < ActiveRecord::Base
	mount_uploader :path, ImageUploader
 	belongs_to :gallery
 	# HACK: on MYSQL to order nulls last
 	default_scope order("-`order` DESC")

end
