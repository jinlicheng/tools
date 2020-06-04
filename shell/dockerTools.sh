#!/bin/bash

set -e

cleanimg() {
    echo "cleanning all images"
}

cleancontaniner() {
    echo "cleanning all containers"
}

saveimg() {
    Images=$(docker images |sed -n '2,$p' |awk '{print $1":"$2}')
    echo "$Images" | while read line
    do 
      Tar=${line##*/}
      Cmd="docker save $line -o ${Tar//:/.}.tar"
      echo "$Cmd"
      $Cmd
    done
}

saveimg

exit 0

