def set_up_test_env
  conn = PG.connect( dbname: 'bookmark_manager_test' )
  conn.exec("DROP TABLE bookmarks")
  # delete all records
  conn.exec("SELECT * INTO bookmarks FROM bookmarks_reset")
  # copy over all records from table that contains default values
  Bookmark.connect(true)
end