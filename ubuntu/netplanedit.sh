#!/bin/bash

sudo sed -i 's/192.168.200.10/192.168.200.150/g' /etc/netplan/00-installer-config.yaml
sudo netplan apply