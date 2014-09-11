#!/bin/bash

size='4G'

if [ ! $# -gt 0 ]; then
    size=$0
fi

fallocate -l $size /swapfile
chmod 600 /swapfile
mkswap /swapfile
sudo swapon /swapfile
echo "/swapfile       swap    swap    auto      0       0" | sudo tee -a /etc/fstab
sudo sysctl -w vm.swappiness=10
echo vm.swappiness = 10 | sudo tee -a /etc/sysctl.conf
