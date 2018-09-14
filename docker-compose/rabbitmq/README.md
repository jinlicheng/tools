# 集群搭建方法

## 参考文章

https://www.cnblogs.com/vipstone/p/9362388.html
http://www.dockone.io/article/829

## 步骤

### 主节点

```shell
rabbitmqctl stop_app
rabbitmqctl reset
rabbitmqctl start_ap
```

### 从节点

```shell
rabbitmqctl stop_app
rabbitmqctl reset
rabbitmqctl join_cluster --ram rabbit@rabbit1
rabbitmqctl start_app
```

## 操作

```shell
rabbitmqctl add_user mq 123456
rabbitmqctl set_user_tags mq administrator
rabbitmqctl set_permissions -p "/" mq ".*" ".*" ".*"
rabbitmqctl list_permissions -p "/"
```
