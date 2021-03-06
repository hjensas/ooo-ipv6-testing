ooo-ipv6-testing
================

Set up OVB environment
----------------------

::

  mkdir ~/ovb-ipv6-lab
  virtualenv ~/ovb-ipv6-lab
  source ~/ovb-ipv6-lab/bin/activate
  git clone https://opendev.org/openstack/openstack-virtual-baremetal.git ~/ovb-ipv6-lab/openstack-virtual-baremetal
  cd ~/ovb-ipv6-lab/openstack-virtual-baremetal
  git fetch https://review.opendev.org/openstack/openstack-virtual-baremetal refs/changes/77/713077/1 && git checkout FETCH_HEAD
  git switch -c ref-713077
  cd
  pip install ~/ovb-ipv6-lab/openstack-virtual-baremetal
  pip install python-openstackclient
  pip install ansible
  git clone git@github.com:hjensas/ooo-ipv6-testing.git ~/ovb-ipv6-lab/ooo-ipv6-testing
  cp ~/ovb-ipv6-lab/ooo-ipv6-testing/ovb/* ~/ovb-ipv6-lab/openstack-virtual-baremetal/

Set up OVB routed-networks lab
------------------------------

The OVB environment files expect:
 - A pre-existing private network to be available in the tenant.
   This network also need to be connected to a router with a connection
   to the external network.
 - A key, key_name: default must exist

  .. NOTE:: Source the cloud RC file first

::

  cd ~/ovb-ipv6-lab/openstack-virtual-baremetal/
  bash ~/ovb-ipv6-lab/openstack-virtual-baremetal/deploy_ovb.sh



