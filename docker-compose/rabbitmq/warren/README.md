# rabbit warren搭建方法

## 步骤

### 主节点

```shell
rabbitmqctl stop_app
rabbitmqctl reset
rabbitmqctl start_ap

rabbitmqctl add_user mq 123456
rabbitmqctl set_user_tags mq administrator
rabbitmqctl set_permissions -p "/" mq ".*" ".*" ".*"
rabbitmqctl list_permissions -p "/"

rabbitmqctl add_vhosts test
rabbitmqctl set_permissions -p "test" mq ".*" ".*" ".*"
rabbitmqctl list_permissions -p "test"
```

### 备用节点

```shell
rabbitmqctl stop_app
rabbitmqctl reset
rabbitmqctl start_app

rabbitmqctl add_user mq 123456
rabbitmqctl set_user_tags mq administrator
rabbitmqctl set_permissions -p "/" mq ".*" ".*" ".*"
rabbitmqctl list_permissions -p "/"

rabbitmqctl add_vhosts test
rabbitmqctl set_permissions -p "test" mq ".*" ".*" ".*"
rabbitmqctl list_permissions -p "test"
```

## URL
rabbitmq console_master http://127.0.0.1:15672/  
rabbitmq console_backup http://127.0.0.1:15673/  
haproxy console http://127.0.0.1:5669/haproxy?stats

