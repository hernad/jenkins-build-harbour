#!/bin/bash

SSH_DOWNLOAD_SERVER=docker@192.168.168.171
FILE="hb_linux_i386.tar.gz"
DOWNLOADS_DIR=/data_0/f18-downloads_0/downloads.bring.out.ba/www/files/

./prepare_build.sh

[ -f $FILE ] && rm $FILE


vagrant --version
vagrant up --provision
vagrant halt

if [ ! -f $FILE ] ; then
   echo "$FILE not created ?!"
   exit 1
fi

[ -f .ssh_download_key ] || exit 1

echo "scp $SSH_DOWNLOAD_SERVER $DOWNLOADS_DIR" 

scp -i .ssh_download_key \
  -o StrictHostKeyChecking=no \
 $FILE \
 $SSH_DOWNLOAD_SERVER:$DOWNLOADS_DIR

ssh -i .ssh_download_key  $SSH_DOWNLOAD_SERVER  ls -lh $DOWNLOADS_DIR/$FILE

