# CassandraCluster
A project using Vagrant and Ansible to create and deploy a Cassandra Cluster with VirtualBox.

By default a 5-Node Cassandra Cluster will be created each with 1GB of RAM and 1 cpu.

Requirements
=============

vagrant 1.9.0
virtualbox 5.0.26 r108824
ansible 2.2.0.0
git version 2.11.0

Getting Started
================

git clone https://github.com/rhysmeister/CassandraCluster.git
cd CassandraCluster
vagrant up

Access the Cassandra Cluster Nodes
==================================

View the status of nodes:

vagrant status;

```
Current machine states:

cnode1                    running (virtualbox)
cnode2                    running (virtualbox)
cnode3                    running (virtualbox)
cnode4                    running (virtualbox)
cnode5                    running (virtualbox)
```

To access a node via ssh;

vagrant ssh cnode1

One inside the host we can view the status of the Cassandra Cluster with nodetool;

```
[vagrant@cnode1 ~]$ nodetool status
Datacenter: datacenter1
=======================
Status=Up/Down
|/ State=Normal/Leaving/Joining/Moving
--  Address         Load       Tokens       Owns (effective)  Host ID                               Rack
UN  192.168.44.104  106.51 KiB  256          40.0%             b191d49f-822c-40d3-bde4-926c4494a707  rack1
UN  192.168.44.105  84.39 KiB  256          39.4%             2b7d5381-7121-46f4-8800-dad9fadc4c85  rack1
UN  192.168.44.101  104.06 KiB  256          39.2%             cd6d8ed2-d0c0-4c90-90a1-bda096b422e1  rack1
UN  192.168.44.102  69.98 KiB  256          41.4%             303c762c-351d-43a6-a910-9a2afa3ec2be  rack1
UN  192.168.44.103  109.04 KiB  256          40.1%             0023da19-7b3f-420b-a6b8-ace8b5118b0d  rack1
```

Cassandra Authentication Details
================================

The Administrator credentials for Cassandra are set in the cassandra.yml file and can be modified.

See the following variables;

```
cassandra_admin_user
cassandra_admin_user_pwd
```

Change these before setting up the cluster.
