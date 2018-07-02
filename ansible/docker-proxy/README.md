# docker proxy

## run
```
ansible-playbook -i hosts docker-proxy.yaml --extra-vars "host=192.168.200.180 port=8123"

```

## check
```
ansible -i hosts all -m shell -a "docker info"
```
