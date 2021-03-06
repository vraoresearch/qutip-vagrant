#!/usr/bin/env bash

# source: https://github.com/StanAngeloff/vagrant-shell-scripts
apt-mirror-pick() {
  $SUDO sed -i \
    -e "s#\w\+\.archive\.ubuntu\.com#$1.archive.ubuntu.com#g" \
    -e "s#security\.ubuntu\.com#$1.archive.ubuntu.com#g" \
    '/etc/apt/sources.list'
}

# apt-mirror-pick 'jp'

VERSION=2.2.0

apt-get update

wget http://qutip.org/downloads/$VERSION/QuTiP-$VERSION.tar.gz -O /vagrant/qutip-$VERSION.tar.gz

apt-get install -y gfortran libblas-dev liblapack-dev

# python2 environment
apt-get install -y python-nose python-pip python-dev cython python-setuptools
apt-get install -y python-numpy python-scipy python-matplotlib
cd /tmp && tar zxfv /vagrant/qutip-$VERSION.tar.gz
cd /tmp/qutip-$VERSION && python setup.py install --with-f90mc
rm -rf /tmp/qutip-$VERSION
