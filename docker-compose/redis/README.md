# 集群搭建方法

## 参考文章

https://www.cnblogs.com/jiawen010/articles/11399194.html


## 配置修改

下载一个redis的源码包，找到redis.conf，修改

```shell
　　daemonize yes //redis后台运行,docker运行时要为no
　　port 7000 //端口7000,7002,7003
　　cluster-enabled yes //开启集群 把注释#去掉
　　cluster-config-file nodes.conf //集群的配置 配置文件首次启动自动生成 7000,7001,7002
　　cluster-node-timeout 5000 //请求超时 设置5秒够了
　　appendonly yes //aof日志开启 有需要就开启，它会每次写操作都记录一条日志
　　bind 127.0.0.1 172.16.244.144(此处为自己内网的ip地址，centos7下面采用ip addr来查看，其他系统试一下ifconfig查看，ip为)

　　dir /root/application/program/redis-cluster/7000/  //修改数据文件存放地址，以端口号为目录名来区分（这点一定要注意）
```

## 连接redis 创建集群

```shell
docker run -it --network host --rm redis:6.0.5-alpine3.12 sh
redis-cli --cluster create 127.0.0.1:7000 127.0.0.1:7001 127.0.0.1:7002 127.0.0.1:7003 127.0.0.1:7004 127.0.0.1:7005 --cluster-replicas 1
```

## redis 集群扩容

https://blog.csdn.net/men_wen/article/details/72896682

