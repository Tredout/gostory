class Pin < ActiveRecord::Base
	attr_accessible :description, :image
	has_attached_file :image, styles: { medium: "320x240>"}

	validates :description, presence: true
	validates :user_id, presence: true
	validates_attachment :image, presence: true,
  						# content_type: { content_type: ["image/jpeg", "image/jpg", "image/gif", "image/png"] },
  						size: { in: 0..5.megabytes }
  	validates_attachment_content_type :image, :content_type => /\Aimage/

	belongs_to :user
	
end