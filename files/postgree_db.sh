#!/usr/bin/bash
# Add apt key
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# Add official Postgres repository
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Update apt
apt-get update

# Install Postgres and Postgres contrib
apt-get install postgresql postgresql-contrib -y

# Switch to root directory
cd /

# Create a new user from the command line by a root user
sudo -u postgres createuser ekene

# Create a new database
sudo -u postgres createdb ekenedb

# connect the database with the user and grant all privileges
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE ekenedb TO ekene"

# Restart Postgres
sudo service postgresql restart
