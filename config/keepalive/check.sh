#!/bin/bash
check_service(){
    st=`curl -sL -w "%{http_code}" "localhost:8080/devops-deployer/" -o /dev/null`
    if [ "$st" -ne "200" ]; then
        return 1
    fi
    return 0
}

check_docker_ps(){
    dp=`docker ps -qf name=$1 |wc -l`
    if [ "$dp" -ne "1" ]; then
        return 1
    fi
    return 0
}

vip=`ip a |grep '10.19.38.206' |wc -l`
if [ "$vip" != "1" ]; then
    docker stop $(docker ps -qaf name=devops)
else
    check_docker_ps "devops-deployer"
    if [ "$?" -eq "1" ]; then
        docker restart devops-deployer
        sleep 3

        check_docker_ps "devops-deployer"
        if [ "$?" -eq "1" ]; then
            exit 1
        fi
    fi

    check_docker_ps "devops-registrator"
    if [ "$?" -eq "1" ]; then
        docker restart devops-registrator
        sleep 3

        check_docker_ps "devops-registrator"
        if [ "$?" -eq "1" ]; then
            exit 1
        fi
    fi

    for i in $(seq 1 10); do
      sleep 1
      [[ $(check_service) == "0" ]] && exit 0
      ((i>=10)) && exit 1
      ((i++))
    done
fi
