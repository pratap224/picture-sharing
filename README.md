this application gives you brief explation on image sharing in ruby on rails
first download the file and extract it
open terminal and enter $cd photosharing (if the file is in home)
after goto terminal and enter $bundel install

then after change database.yml password (photoshare/config/database.yml)
development:
  adapter: mysql2
  encoding: utf8
  database: photoshare_development
  pool: 5
  username: root
  password: *****
  socket: /var/run/mysqld/mysqld.sock
  then again go to terminal and type 
  $rake db:create
  after creation we have to migrate the file so type 
  $rake db:migration
  after sucessfully migration we have to start server by using
  $rails s
  the server will start 
  then open our browser and type the url path that is
  http://localhost:3000/
  
# picture-sharing
