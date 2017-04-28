#!/bin/bash

VDI_BASE=~/data_harbour_core.vdi 
[ ! -f $VDI_BASE ]  || VBoxManage createmedium --size 20000 --format VDI --filename $VDI_BASE

[ -f data.vmdk ] || VBoxManage clonemedium $VDI_BASE data.vdi

