require 'pg'
class Bookmark

	@@all = []
	@@conn = PG.connect( dbname: 'bookmark_manager' )
	# Save connection to instance variable so don't have to keep repeating

	def self.all
		@@all = @@conn.exec( "SELECT * FROM bookmarks").map{|bookmark| bookmark["url"]}
		# Get results
		# Add only urls to @@all array
		@@all
	end

	# ^ Class methods / variables

	attr_reader :link

	def initialize(link)
		@link = link
		@@all << self
	end
end