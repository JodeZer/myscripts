#!/bin/bash

cd /Users/ezbuy/Projects/ezbuy/goflow/uat_mongo_js
echo "=======js list======\n"
key=$1
for file in *
do   
    if [[ "$file" = *"$key"* ]]; then
        if [[ $file = *".js"* ]]; then
            echo "load(\"${file}\")"
        fi
    fi
done
echo "=======js list======\n"
mongo --nodb
