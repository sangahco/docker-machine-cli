#!/usr/bin/env sh

sudo shred -u /etc/ssh/*_key /etc/ssh/*_key.pub

sudo shred -u ~/.ssh/authorized_keys
shred -u ~/.ssh/authorized_keys

sudo shred -u ~/.*history
shred -u ~/.*history

sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*
sudo rm -rf /tmp/*