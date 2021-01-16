require 'pg'
require_relative "database_connection.rb"

class Bookmark

	def self.all
		DatabaseConnection.query("SELECT * FROM bookmarks").map{|record| Bookmark.new(record["url"], record["alias"], false)}
		# Get results -> Array of Bookmark objects
	end

	def self.get_url(title)
		DatabaseConnection.query("SELECT url FROM bookmarks WHERE alias = '#{title}'").map{|record| record["url"]}
	end

	def self.get_title(url)
		DatabaseConnection.query("SELECT alias FROM bookmarks WHERE url = '#{url}'").map{|record| record["alias"]}
	end

	def self.add(bookmark)
		DatabaseConnection.query("INSERT INTO bookmarks (url,alias) VALUES('#{bookmark.url}','#{bookmark.alias}')")
	end

	def self.delete(urls)
		urls.each {|url| DatabaseConnection.query( "DELETE FROM bookmarks WHERE url = '#{url}'") }
	end

	def self.update(params)
		if params["original_url"] != params["new_url"]
			DatabaseConnection.query("UPDATE bookmarks SET url = '#{params["new_url"]}' WHERE url = '#{params["original_url"]}'")
		end
		if params["original_title"] != params["new_title"]
			DatabaseConnection.query("UPDATE bookmarks SET alias = '#{params["new_title"]}' WHERE alias = '#{params["original_title"]}'")
		end
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