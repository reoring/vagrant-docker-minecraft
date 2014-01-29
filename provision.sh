#!/bin/bash

cd /vagrant/containers/minecraft
sudo docker build -t="minecraft" .
docker run -p 25565:25565 -d minecraft
