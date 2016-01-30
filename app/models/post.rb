class Post < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, :styles => { 
                               :medium => "1000x1000>", 
                               :thumb => "100x100>" 
                             },
                    :default_url => "/images/normal/missing.png"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/s

	# geocoded_by :ip_address, :latitude => :lat, :longitude => :lon

	# after_validation :geocode
end
