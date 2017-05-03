#!/bin/bash


echo ======== mount /data =====================
[ -d /data ]  || mkdir -p /data

if ( ! mount | grep -q \/data ) ; then
   sudo mount /dev/sdb1 /data
else
   echo /data mounted
fi

echo ========= install dev deps ==========================
sudo apt-get -y update
sudo apt-get -y install build-essential flex bison libpq-dev


echo ======== /data/build =====================

[ -d /data/build ] || sudo mkdir -p /data/build
sudo chown vagrant /data/build 

cd /data/build

git clone https://github.com/hernad/harbour-core.git
cd harbour-core
git checkout my-master -f
git pull

#export HB_WITH_OPENSSL='c:\msys32\mingw32\include'
#export HB_WITH_PGSQL='c:\msys32\mingw32\include'
#export HB_ARCHITECTURE=win
#export HB_COMPILER=mingw

echo ======== /data/build/hb-linux-i386 =====================
export HB_INSTALL_PREFIX=/data/build/hb-linux-i386
make
make install

cd /data/build
tar cvfz /vagrant/hb-linux-i386.tar.gz hb-linux-i386
