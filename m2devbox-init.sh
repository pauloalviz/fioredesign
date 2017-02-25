#!/bin/bash

echo 'Build docker images'
docker-compose up --build -d
web_port=$(docker-compose port web 80)
web_port=${web_port#*:}



echo 'Install Magento'
varnish_port=$(docker-compose port varnish 6081)
varnish_port=${varnish_port#*:}
docker-compose exec --user magento2 web m2init magento:install --no-interaction --webserver-home-port=$web_port --varnish-home-port=$varnish_port