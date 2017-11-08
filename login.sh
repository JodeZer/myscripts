#!/bin/bash

function containerId {
    id=`docker ps |grep ${1} |awk '{print $1}'`
    echo ${id}
}

containerId $1

echo "sudo docker exec -ti ${id} /bin/sh"
docker exec -ti ${id} /bin/sh


