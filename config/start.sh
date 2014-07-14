#!/bin/bash

/usr/sbin/rinse --arch amd64 --directory /vol/distro/temp --distribution slc-7
cd /vol/distro/temp
tar cvzf ../slc-7rolling.tar.gz .
cd ..
rm -rf temp
