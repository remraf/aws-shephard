#!/usr/bin/env bash
#
# post-install script
#
###

BINDIR=/data/bin
ETCDIR=/data/etc

$BINDIR/install-repo
$BINDIR/install-pkg
#$BINDIR/install-user
