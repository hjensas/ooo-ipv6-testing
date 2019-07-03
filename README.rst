ooo-ipv6-testing
================

Set up OVB environment
----------------------

::

  mkdir ~/ovb-ipv6-lab
  virtualenv ~/ovb-ipv6-lab
  source ~/ovb-ipv6-lab/bin/activate
  git clone https://opendev.org/openstack/openstack-virtual-baremetal.git ~/ovb-ipv6-lab/openstack-virtual-baremetal
  pip install ~/ovb-ipv6-lab/openstack-virtual-baremetal
  pip install python-openstackclient
  pip install ansible
  git clone git@github.com:hjensas/ooo-ipv6-testing.git ~/ovb-ipv6-lab/ooo-ipv6-testing
  cp ~/ovb-ipv6-lab/ooo-ipv6-testing/ovb/* ~/ovb-ipv6-lab/openstack-virtual-baremetal/

