#!/bin/sh
set -u;

CASSANDRA_ADMIN_USER="$1";
CASSANDRA_ADMIN_USER_PWD="$2";

# Test if anonymous access is possible and config auth space if so
cqlsh -e "DESCRIBE KEYSPACES";
if [[ "$?" -eq 0 ]]; then # Anonymous auth is possible
  cqlsh -e "ALTER KEYSPACE \"system_auth\" WITH REPLICATION = {'class' : 'NetworkTopologyStrategy', 'datacenter1' : 3}";
  if [[ "$?" -eq 0 ]]; then
    touch ansible_cassandra_anon_auth.txt;
  fi;
  nodetool repair system_auth;
  sudo service cassandra restart && sleep 5;
  echo "The system_auth keyspace has been reconfigured.";
fi;
# Is access possible with the default cassandra admin credentials
cqlsh -u cassandra -p cassandra -e "DESCRIBE KEYSPACES";
if [[ "$?" -eq 0 ]]; then
  CQL="CREATE ROLE $CASSANDRA_ADMIN_USER WITH PASSWORD = '$CASSANDRA_ADMIN_USER_PWD' AND SUPERUSER = true AND LOGIN = true";
  cqlsh -u cassandra -p cassandra -e "$CQL" && echo "A new Cassandra administrator was created: $CASSANDRA_ADMIN_USER.";
  CQL="ALTER ROLE cassandra WITH PASSWORD = 'sdf345fsdfsrt3reyadsduvfds632gebhsafaseryuusihfsutdfuw' AND SUPERUSER=false";
  cqlsh -u $CASSANDRA_ADMIN_USER -p $CASSANDRA_ADMIN_USER_PWD -e "$CQL" && echo "The default Cassandra admin user was modified."
  if [[ "$?" -eq 0 ]]; then
      touch ansible_cassandra_new_admin_user.txt;
  fi;
fi;

if [ -e ansible_cassandra_anon_auth.txt ] && [ -e ansible_cassandra_new_admin_user.txt ]; then
  touch ansible_cassandra_admin_user_ran_here.txt
fi
