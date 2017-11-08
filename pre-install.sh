#!/bin/bash

# Download and install hyperthread disabling script
wget -O /etc/init.d/disable_hyperthreading https://cfncluster-public-scripts.s3.amazonaws.com/disable_hyperthreading
chmod a+x /etc/init.d/disable_hyperthreading
chkconfig add /etc/init.d/disable_hyperthreading
chkconfig --level 2345 disable_hyperthreading on
/etc/init.d/disable_hyperthreading start
