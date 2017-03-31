#!/usr/bin/env sh

sudo shred -u /etc/ssh/*_key /etc/ssh/*_key.pub

shred -u ~/.ssh/authorized_keys
shred -u ~/.*history

sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*
sudo rm -rf /tmp/*