#!/bin/bash

[ -f data.vmdk ] || VBoxManage clonehd ~/data_core_base_windows.vmdk data.vmdk


[ -f hbwin.tar.gz ] && rm harbour.tar.gz

vagrant --version
vagrant up --provision
vagrant halt

if [ ! -f hbwin.tar.gz ] ; then
   echo "hbwin.tar.gz not created ?!"
   exit 1
fi


SSH_DOWNLOAD_SERVER=docker@192.168.168.171

scp -i .ssh_download_key \
 -o StrictHostKeyChecking=no \
 hbwin.tar.gz \
 $SSH_DOWNLOAD_SERVER:/data_0/f18-downloads_0/downloads.bring.out.ba/www/files/


