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

#
# Patch cloud-init in built image
#
cd /home/centos

git clone -b bug/1806014 https://git.launchpad.net/~harald-jensas/cloud-init

LIBGUESTFS_BACKEND=direct virt-customize --add /home/centos/images/overcloud-full.qcow2 \
  --delete /usr/lib/python2.7/site-packages/cloudinit \
  --selinux-relabel
LIBGUESTFS_BACKEND=direct virt-customize --add /home/centos/images/overcloud-full.qcow2 \
  --copy-in /home/centos/cloud-init/cloudinit:/usr/lib/python2.7/site-packages/ \
  --selinux-relabel
LIBGUESTFS_BACKEND=direct virt-customize --add /home/centos/images/overcloud-full.qcow2 \
  --delete /usr/lib/python2.7/site-packages/cloudinit/tests \
  --selinux-relabel

echo "DONE patching"

