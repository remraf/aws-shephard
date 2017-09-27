#!/bin/bash -l
#
# (Re)Generate SSH keys for a user
#
# ks347 '17

UNAME=$1
HOMEDIR=$2

if [[ $# -ne "2" ]]
  then
    echo "Usage: $0 username homedir"
    exit 1
fi

## Make .ssh dir
mkdir -p $HOMEDIR/.ssh

## Cleanup
if [[ -e $HOMEDIR/.ssh/id_rsa ]]
  then
    rm -f $HOMEDIR/.ssh/id_rsa
fi

## Keygen
ssh-keygen -t rsa -b 4096 -P "" -f $HOMEDIR/.ssh/id_rsa
cat $HOMEDIR/.ssh/id_rsa.pub > $HOMEDIR/.ssh/authorized_keys2

## Permissions
chown -R $UNAME:$UNAME $HOMEDIR/.ssh
chmod 700 $HOMEDIR/.ssh
chmod 400 $HOMEDIR/.ssh/authorized_keys2

