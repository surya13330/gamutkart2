#!/bin/bash
cont_count=$1
echo "creating $cont_count containers.."
sleep 2;
for i in `seq $cont_count`
do
	echo "=============================="
    echo "Creating gamutkart-server$i container.."
    sleep 1
    docker run -it -d --name gamutkart-server$i nageshvkn/gamutkart-img
    echo "gamutkart-server$i container has been created!"
	echo "=============================="
done
docker inspect --format {{.NetworkSettings.Networks.bridge.IPAddress}} `docker ps -q` > IPs.txt
