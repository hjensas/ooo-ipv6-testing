#!/bin/bash

#
# THT changes
#
cd /home/centos/tripleo-heat-templates
# Undercloud hosts entries in overcloud nodes
git fetch https://review.opendev.org/openstack/tripleo-heat-templates refs/changes/49/687349/2 && git checkout FETCH_HEAD
git checkout -b bug/1836578
git checkout master

# Do the rebases
git checkout bug/1836578

#
# python-tripleoclient changes
#
cd /home/centos
git clone https://opendev.org/openstack/python-tripleoclient.git
cd /home/centos/python-tripleoclient
# Use name for container registry
git fetch https://review.opendev.org/openstack/python-tripleoclient refs/changes/88/687388/7 && git checkout FETCH_HEAD
git checkout -b bug/1836578
git rebase master
git checkout master tripleoclient/tests
git checkout master releasenotes
git format-patch master --stdout | sudo patch -p1 -d /usr/lib/python2.7/site-packages

#
# tripleo-common changes
#
cd /home/centos
git clone https://opendev.org/openstack/tripleo-common.git
cd /home/centos/tripleo-common
# Get undercloud name in get_undercloud_registry()
git fetch https://review.opendev.org/openstack/tripleo-common refs/changes/05/687305/9 && git checkout FETCH_HEAD
git checkout -b bug/1847141
git rebase master
git checkout master tripleo_common/tests
git checkout master releasenotes
git add tripleo_common
git add releasenotes
git commit -a --amend -m 'ready for patch'
git format-patch master --stdout | sudo patch -p1 -d /usr/lib/python2.7/site-packages

cd /home/centos

