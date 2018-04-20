# use ansible run something no remote dest

## install nfs-common on remote ubuntu

``` shell
ansible all -m apt -a "pkg=nfs-common" -i ./hosts
```

## copy file to remote

```shell
ansible all -m copy -a "src=./kube-worker.pub dest=~/kube-worker.pub" -i ./hosts
```

## exec shell command on remote

```shell
ansible all -m shell -a "cat ~/kube-worker.pub >> ~/.ssh/authorized_keys && rm -f ~/kube-worker.pub" -i ./hosts
```
