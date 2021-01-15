# Bookmarks Manager
This is the code for a Bookmarks Manager web page using a database

# Setup

## Set up main environment

* Connect to psql
* Create the database using the psql command CREATE DATABASE bookmark_manager;
* Connect to the database using the pqsl command \c bookmark_manager;
* Run the query we have saved in the file 01_create_bookmarks_table.sql

## Set up testing environment
* Connect to psql
* Create the database using the psql command CREATE DATABASE bookmark_manager_test;
* Connect to the database using the pqsl command \c bookmark_manager_test;
* Run the query we have saved in the file 01_create_bookmarks_table.sql again
* Run the queries we have saved in the file 02_create_base_table.sql


# To Run
```
  rackup
```

# User Stories

```
As a user,
So that I can see all the bookmarks,
I'd like the page to show a list of bookmarks
```