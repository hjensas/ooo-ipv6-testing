#!/bin/bash

#
# THT changes
#
# cd /home/centos/tripleo-heat-templates

#
# python-tripleoclient changes
#
# cd /home/centos
# git clone https://opendev.org/openstack/python-tripleoclient.git
# cd /home/centos/python-tripleoclient

#
# tripleo-common changes
#
# cd /home/centos
# git clone https://opendev.org/openstack/tripleo-common.git
# cd /home/centos/tripleo-common
# Get undercloud name in get_undercloud_registry()
# git rebase master
# git checkout master tripleo_common/tests
# git checkout master releasenotes
# git add tripleo_common
# git add releasenotes
# git commit -a --amend -m 'ready for patch'
# git format-patch master --stdout | sudo patch -p1 -d /usr/lib/python2.7/site-packages
# 
# cd /home/centos

echo "DONE patching"

