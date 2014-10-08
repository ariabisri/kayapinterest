class Gambar < ActiveRecord::Base
	#attr_accessible :title, :lokasi
	validates :title, presence: true
	validates :lokasi, presence: true
	mount_uploader :lokasi, GambarUploader
end
