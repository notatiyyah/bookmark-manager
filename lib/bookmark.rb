class Bookmark
	@@all = []

	def self.all
		@@all
	end

	def self.all_links
		@@all.map(&:link)
	end

	def self.pre_load
		Bookmark.new("https://thoughtbot.com/upcase/test-driven-rails-resources/capybara.pdf")
		Bookmark.new("https://github.com/makersacademy")
	end

	# ^ Class methods / variables

	attr_reader :link

	def initialize(link)
		@link = link
		@@all << self
	end
end