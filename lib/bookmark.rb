require 'pg'
class Bookmark

	@@all = []
	@@conn = nil

	def self.connect(is_testing=false)
		@@conn = PG.connect( dbname: is_testing ? 'bookmark_manager_test' : 'bookmark_manager' )
		# Save connection to instance variable so don't have to keep repeating
	end

	def self.all
		self.connect if @@conn.nil?
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