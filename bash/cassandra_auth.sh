#!/bin/sh
set -u;

CASSANDRA_ADMIN_USER="$1";
CASSANDRA_ADMIN_USER_PWD="$2";

export CQLSH_HOST=192.168.44.101;

# Is access possible with the default cassandra admin credentials
cqlsh -u cassandra -p cassandra -e "DESCRIBE KEYSPACES";
if [[ "$?" -eq 0 ]]; then
  CQL="ALTER KEYSPACE \"system_auth\" WITH REPLICATION = {'class' : 'NetworkTopologyStrategy', 'datacenter1' : 3}";
  cqlsh -u cassandra -p cassandra -e "$CQL" && echo "The system_auth keyspace has been reconfigured."
  nodetool repair system_auth && sudo service cassandra restart && sleep 5;
  cqlsh -u cassandra -p cassandra -f /home/vagrant/cassandra_admin_user.cql && echo "A new Cassandra administrator was created: $CASSANDRA_ADMIN_USER.";
  CQL="ALTER ROLE cassandra WITH PASSWORD = 'sdf345fsdfsrt3reyadsduvfds632gebhsafaseryuusihfsutdfuw' AND SUPERUSER=false";
  cqlsh -u $CASSANDRA_ADMIN_USER -p $CASSANDRA_ADMIN_USER_PWD -e "$CQL" && echo "The default Cassandra admin user was modified."
  if [[ "$?" -eq 0 ]]; then
      touch ansible_cassandra_new_admin_user.txt;
  fi;
else
  echo "Could not access cassandra with default credentials";
fi;
