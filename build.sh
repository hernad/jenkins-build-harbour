#!/bin/bash


echo ======== mount /data =====================
[ -d /data ]  || mkdir -p /data

if ( ! mount | grep -q \/data ) ; then
   sudo mount /dev/sdb1 /data
else
   echo /data mounted
fi

echo ========= install dev deps ==========================

if ! dpkg -l libx11-dev
then
  sudo apt-get -y update
  sudo apt-get -y install libx11-dev build-essential flex bison libpq-dev
fi

echo ======== /data/build =====================

[ -d /data/build ] || sudo mkdir -p /data/build
sudo chown vagrant /data/build 

cd /data/build

git clone https://github.com/hernad/harbour-core.git
cd harbour-core
git checkout my-master -f
git pull


echo ======== /data/build/hb-linux-i386 =====================
export HB_INSTALL_PREFIX=/data/build/hb-linux
make
make install

cd /data/build
tar cvfz /vagrant/hb-linux.tar.gz hb-linux
