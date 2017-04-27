#!/bin/bash


[ ! -f ~/data_harbour_core.vdi ]  || VBoxManage createmedium --size 20000 --format VDI --filename ~/data_harbour_core.vdi

[ -f data.vmdk ] || VBoxManage clonemedium ~/data_harbour_core.vdi data.vdi

