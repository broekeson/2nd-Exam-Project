#!/usr/bin/bash

# Install ca-certificates
apt-get install ca-certificates

# Add apt key
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# Add official Postgres repository
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Update apt
apt-get update

# Install Postgres and Postgres contrib
apt-get install postgresql postgresql-contrib 

# Create a new user
sudo -u postgres createuser --interactive

# Create a new database
sudo -u postgres createdb mydb

# Connect to the database
sudo -u postgres psql mydb

# exit the database
\q

# Restart Postgres
sudo service postgresql restart
