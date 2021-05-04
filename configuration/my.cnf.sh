[mysqld]
#datadir=/var/lib/mysql
datadir=/mysql
#socket=/var/lib/mysql/mysql.sock
socket=/mysql/mysql.sock
user=mysql

#####__Chong mat dong bo DB___
sync_binlog = 0
##############################

# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0

# Path to Galera library
wsrep_provider=/usr/lib64/libgalera_smm.so

# Cluster connection URL contains the IPs of node#1, node#2 and node#3
wsrep_cluster_address=gcomm://192.168.0.22,192.168.0.21,192.168.0.20

# In order for Galera to work correctly binlog format should be ROW
binlog_format=ROW

# MyISAM storage engine has only experimental support
default_storage_engine=InnoDB

# This changes how InnoDB autoincrement locks are managed and is a requirement for Galera
innodb_autoinc_lock_mode=2

# Node #2 address
wsrep_node_address=192.168.0.22

# SST method
wsrep_sst_method=xtrabackup-v2

# Cluster name
wsrep_cluster_name=MINIBUNDLE-CLUSTER-NEW

# Authentication for SST method
wsrep_sst_auth="sst:passwd123"

# Enable Scheduler 
#event_scheduler=ON
slow_query_log=ON
#slow-query-log-file = /var/lib/mysql/mysql-slow-query.log
slow-query-log-file = /mysql/mysql-slow-query.log

############### Turning Mysql ########################## 
innodb_buffer_pool_size=100G
innodb_change_buffering=all
#innodb_additional_mem_pool_size=4M
innodb_file_per_table=1
innodb_log_file_size=6G
innodb_log_buffer_size=256M
innodb_flush_log_at_trx_commit=0
innodb_thread_concurrency=32
innodb_flush_method=O_DIRECT
innodb_io_capacity_max=21000
innodb_lru_scan_depth=1000
innodb_read_io_threads=8
innodb_write_io_threads=8
innodb_io_capacity=1000
innodb_lock_wait_timeout=120
#innodb_data_file_path=ibdata1:50M;ibdata2:50M:autoextend
innodb_buffer_pool_load_at_startup=ON
innodb_log_files_in_group=4
skip-innodb_doublewrite
join_buffer_size=64M
innodb_buffer_pool_instances=64
wsrep_slave_threads = 64
read_buffer_size=512M
sort_buffer_size=512M
bulk_insert_buffer_size = 256M
read_rnd_buffer_size=64M
innodb_sort_buffer_size=64M
key_buffer_size=512M
thread_pool_size=64
thread_cache_size=2600
table_open_cache=4096
skip-host-cache
skip-name-resolve
auto_increment_increment = 1
auto_increment_offset = 1
tmp_table_size=2G
max_heap_table_size=10G
thread_stack= 256K

############### Turning Cluster ##########################
# Query Cache is not supported with wsrep
query_cache_size=0
query_cache_type=0
max_connect_errors=1000000
max_connections=6000
max_user_connections=3000
max_allowed_packet=256M


[mysqld_safe]
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid

[xtrabackup]
target_dir = /opt/backupdb/mysql
