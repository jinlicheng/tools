# 集群搭建方法

## 参考文章

http:#blog.51cto.com/arkling/2114963

## mysql container

### docker start mysql command

```shell
docker run -d --name some-mariadb \
    -v /my/custom:/etc/mysql/conf.d \
    -e MYSQL_ROOT_PASSWORD=my-secret-pw \
    -v /my/own/datadir:/var/lib/mysq \
    mariadb:tag --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci 
```
其他环境变量： 
* MYSQL_RANDOM_ROOT_PASSWORD
* MYSQL_ROOT_PASSWORD
* MYSQL_DATABASE
* MYSQL_USER, MYSQL_PASSWORD
* MYSQL_ALLOW_EMPTY_PASSWORD

### dump command

```shell
docker exec some-mariadb sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"' > /some/path/on/your/host/all-databases.sql
```

### connect command line
```shell
docker run -it --link some-mariadb:mysql --rm mariadb sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'
```

### mysql主从配置参数

```
server-id=202                      #这里的ID号与从库上或者主库上的ID必须保证不唯一
log-bin=mysql-bin                  #可以自定义 这里定义为 log-bin=/data/log-bin/log-bin-3310
binlog_format=row                  #主从复制模式 statement,row,mixed
log-slave-updates=true             #slave 更新是否记入日志
gtid-mode=on                       # 启用gtid类型，否则就是普通的复制架构
gtid_strict_mode=ON
enforce-gtid-consistency=true      #强制GTID 的一致性 
master-info-repository=TABLE       #主服信息记录库=表 /文件
relay-log-info-repository=TABLE    #中继日志信息记录库
sync-master-info=1                 #同步主库信息
slave-parallel-workers=4           #从服务器的SQL 线程数，要复制库数目相同
binlog-checksum=CRC32              # 校验码 ，可以自定义
master-verify-checksum=1           #主服校验
slave-sql-verify-checksum=1        #从服校验
binlog-rows-query-log_events=1     #二进制日志详细记录事件
log-bin-trust-function-creators=1  #信任子程序的创建者，禁止创建、修改子程序时对SUPER权限的要求
report-port=3310                   #提供复制报告端口，当前实例端口号
report-host=192.168.1.32           #提供复制报告主机，本机的ip地址
--------------------------------------------------------------------------------------------------------------
replicate-wild-ignore-table=mysql.%
replicate-wild-ignore-table=test.%
replicate-wild-ignore-table=performance_schema.%
（可以在配置文件里加入，作用屏蔽要复制的库）
```

## 步骤

### 1. 在A主机上创建复制账号并导入数据库(172.18.0.2)

```shell
grant replication slave on *.* to 'bak'@'172.18.0.%' identified by 'bakpassword';
flush privileges;
source $PWD/createDatabase.sql;
```

### 2. 将B主机的Master指向A主机(172.18.0.3)

```shell
CHANGE MASTER TO master_host='172.18.0.2', master_port=3306, master_user='bak', master_password='bakpassword';
start slave;
grant replication slave on *.* to 'bak'@'172.18.0.%' identified by 'bakpassword';
flush privileges;
```

### 3. 将A主机的Master指向B主机(172.18.0.2)

```shell
CHANGE MASTER TO master_host='172.18.0.3', master_port=3306, master_user='bak', master_password='bakpassword',master_use_gtid=current_pos;
start slave;
```


