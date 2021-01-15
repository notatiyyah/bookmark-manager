CREATE TABLE bookmarks_reset(id SERIAL PRIMARY KEY, url VARCHAR(60), alias VARCHAR(60));
INSERT INTO bookmarks_reset (url, alias) VALUES('http://www.makersacademy.com', 'Makers');
INSERT INTO bookmarks_reset (url, alias) VALUES('http://www.destroyallsoftware.com', 'Destroy All Software');
INSERT INTO bookmarks_reset (url, alias) VALUES('https://google.com', 'Google');