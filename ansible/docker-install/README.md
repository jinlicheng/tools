# docker install

## run
```
ansible-playbook -i hosts docker-install.yaml 

```

## check
```
ansible -i hosts all -m shell -a "docker info"
```
