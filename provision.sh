#!/bin/bash

cd /vagrant/containers/minecraft
sudo docker build -t="minecraft" .
docker run -d minecraft
