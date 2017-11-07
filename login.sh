#!/bin/bash

#id="" 
function containerId {
    id=`docker ps |grep anduin |awk '{print $1}'`
    echo ${id}
}

containerId $1

echo "sudo docker exec -ti ${id} /bin/sh"
docker exec -ti ${id} /bin/sh


