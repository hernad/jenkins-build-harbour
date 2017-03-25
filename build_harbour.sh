#!/bin/bash

[ -f data.vmdk ] || VBoxManage clonehd ~/data_core_base_windows.vmdk data.vmdk


[ -f harbour.tar.gz ] && rm harbour.tar.gz

vagrant --version
vagrant up
vagrant provision
vagrant halt

if [ ! -f LO.tar.gz ] ; then
   echo "harbour.tar.gz not created ?!"
   exit 1
fi
