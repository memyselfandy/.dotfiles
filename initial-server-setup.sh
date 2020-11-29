#!/bin/bash
# Purpose - Script to add a first sudo, setup firewall and 
#           disable root login

# Inspired by - Vivek Gite <www.cyberciti.biz> under GPL v2.0+
# ------------------------------------------------------------------


# Am I Root user?
if [ $(id -u) -eq 0 ]; then
  read -p "Enter username : " username
  read -s -p "Enter password : " password
  egrep "^$username" /etc/passwd >/dev/null
  if [ $? -eq 0 ]; then
    echo "$username exists!"
    exit 1
  else
    pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
    useradd -m -p "$pass" "$username"
    usermod -aG sudo $username
    rsync --archive --chown=$username:$username ~/.ssh /home/$username
    [ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
  fi
else
  echo "Only root may add a user to the system."
  exit 2
fi

# Enable basic firewall
ufw allow OpenSSH
ufw enable

# Disable root login
passwd dl root
