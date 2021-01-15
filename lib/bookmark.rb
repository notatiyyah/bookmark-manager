require 'pg'
class Bookmark

	@@conn = nil

	def self.connect(is_testing=false)
		@@conn = PG.connect( dbname: is_testing ? 'bookmark_manager_test' : 'bookmark_manager' )
		# Save connection to instance variable so don't have to keep repeating
	end

	def self.all
		self.connect if @@conn.nil?
		@@conn.exec( "SELECT * FROM bookmarks").map{|bookmark| bookmark["url"]}
		# Get results
		# Add only urls to @@all array
		end

	# ^ Class methods / variables
	# v Instance methods 

	def initialize(link)
		add_to_db(link)
	end

	def add_to_db(link)
		Bookmark.connect if @@conn.nil?
		@@conn.exec( "INSERT INTO bookmarks (url) VALUES('#{link}')")
	end
	
end