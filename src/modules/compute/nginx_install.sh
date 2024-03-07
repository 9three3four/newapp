#!/bin/bash
#sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
		sleep 1
done

#install nginx
sudo amazon-linux-extras install -y nginx1

#ensure nginx is started
sudo systemctl enable nginx
sudo systemctl start nginx
