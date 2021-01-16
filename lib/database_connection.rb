class DatabaseConnection

  @@conn = nil

  def self.connect(is_testing=false)
		@@conn = PG.connect( dbname: is_testing ? 'bookmark_manager_test' : 'bookmark_manager' )
		# Save connection to instance variable so don't have to keep repeating
  end
  
  def self.db
    @@conn.db == "bookmark_manager_test" ? "testing" : "production"
  end

  def self.query(query_string)
    self.connect if @@conn.nil?
    @@conn.exec(query_string)
  end

end