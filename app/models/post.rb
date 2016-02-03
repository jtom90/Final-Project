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

	# Venue.near('Omaha, NE, US', 20)    # venues within 20 miles of Omaha
	# Venue.near([40.71, -100.23], 20)    # venues within 20 miles of a point
	# Venue.near([40.71, -100.23], 20, :units => :km)
 #                                   # venues within 20 kilometres of a point
	# Venue.geocoded                     # venues with coordinates
	# Venue.not_geocoded                 # venues without coordinates
end
