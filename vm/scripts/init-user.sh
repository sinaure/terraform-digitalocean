#!/bin/bash
for username in mahaut furkan lucas; do 
  sudo useradd -m -g docker -p $username -s /bin/bash $username;
  mkdir -p /home/$username/.ssh;
  sudo chown -R $username:docker /home/$username/.ssh;
  sudo chmod 700 /home/$username/.ssh;
  touch /home/$username/.ssh/authorized_keys;
  sudo chmod 600 /home/$username/.ssh/authorized_keys;
done