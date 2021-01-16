def set_up_test_env
  DatabaseConnection.connect(true)
  DatabaseConnection.query("DROP TABLE bookmarks")
  # delete all records
  DatabaseConnection.query("SELECT * INTO bookmarks FROM bookmarks_reset")
  # copy over all records from table that contains default values
end