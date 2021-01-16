require 'pg'

class Bookmark

	@@conn = nil

	def self.connect(is_testing=false)
		@@conn = PG.connect( dbname: is_testing ? 'bookmark_manager_test' : 'bookmark_manager' )
		# Save connection to instance variable so don't have to keep repeating
	end

	def self.all
		self.connect if @@conn.nil?
		@@conn.exec( "SELECT * FROM bookmarks").map{|record| Bookmark.new(record["url"], record["alias"], false)}
		# Get results -> Array of Bookmark objects
	end

	def self.get_url(title)
		self.connect if @@conn.nil?
		@@conn.exec( "SELECT url FROM bookmarks WHERE alias = '#{title}'").map{|record| record["url"]}
	end

	def self.add(bookmark)
		self.connect if @@conn.nil?
		@@conn.exec( "INSERT INTO bookmarks (url,alias) VALUES('#{bookmark.url}','#{bookmark.alias}')")
	end

	def self.delete(urls)
		self.connect if @@conn.nil?
		urls.each {|url| @@conn.exec( "DELETE FROM bookmarks WHERE url = '#{url}'") }
	end

	# ^ Class methods / variables
	# v Instance methods 

	attr_reader :alias, :url

	def initialize(link, name, add_to_db=true)
		@alias = name
		@url = link
		Bookmark.add(self) if add_to_db
	end

end