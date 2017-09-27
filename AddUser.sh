#!/bin/bash -l
#
# Add a user and group
#
# ks347 '17

USERID=$1
GROUPID=$2
USERNAME=$3

if [[ $# -ne "3" ]]
  then
    echo "Usage: $0 uid gid username"
    exit 1
fi

getent group $USERNAME >/dev/null 2>&1
if [[ $? -ne "0" ]]
  then
    groupadd -g $GROUPID $USERNAME
else
   echo "Group Exists."
fi

getent passwd $USERNAME >/dev/null 2>&1
if [[ $? -ne "0" ]]
  then
    useradd -u $USERID -g $GROUPID -m -G jupyter-users -d /data/home/$USERNAME $USERNAME
else
  echo "User Exists."
fi

