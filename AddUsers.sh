#!/bin/bash -l
#
# Auto-Generate accounts based on the contents of userlist
#
# ks347 '17

USERLIST=/data/etc/userlist

USERS=$(cat $USERLIST |grep -v "^#")

for entry in $USERS
  do
    user=$(echo $entry |cut -d: -f1)
    uid=$(echo $entry |cut -d: -f2)
    gid=$(echo $entry |cut -d: -f3)

    /data/bin/AddUser.sh $uid $gid $user
    /data/bin/AddSSHKeys.sh $user /data/home/$user
done

